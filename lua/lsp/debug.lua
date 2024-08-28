return {
    'mfussenegger/nvim-dap',
    dependencies = {
        'rcarriga/nvim-dap-ui',     -- UI for nvim-dap
        'nvim-neotest/nvim-nio',    -- Required dependency for nvim-dap-ui
        'williamboman/mason.nvim',  -- Mason for managing LSP, DAP, etc.
        'jay-babu/mason-nvim-dap.nvim', -- Installs DAP adapters via Mason
        'leoluz/nvim-dap-go',       -- Go debugging with Delve
        -- Add more language-specific DAP plugins if needed
    },
    keys = function(_, keys)
        local dap = require 'dap'
        local dapui = require 'dapui'
        return {
            -- Updated debugging keymaps using Shift + Number keys
            { ')',         dap.continue,          desc = 'Debug: Start/Continue' }, -- Shift-5
            { '!',         dap.step_into,         desc = 'Debug: Step Into' }, -- Shift-1
            { '@',         dap.step_over,         desc = 'Debug: Step Over' }, -- Shift-2
            { '#',         dap.step_out,          desc = 'Debug: Step Out' }, -- Shift-3
            { '<leader>b', dap.toggle_breakpoint, desc = 'Debug: Toggle Breakpoint' },
            {
                '<leader>B',
                function()
                    dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
                end,
                desc = 'Debug: Set Breakpoint',
            },
            -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
            { '<leader>u', dapui.toggle, desc = 'Debug: See last session result.' },
            unpack(keys),
        }
    end,
    config = function()
        local dap = require 'dap'
        local dapui = require 'dapui'

        require('mason-nvim-dap').setup {
            automatic_installation = true,
            handlers = {},
            ensure_installed = {
                'delve', -- Go
                'python', -- Python
                'node2', -- JavaScript/TypeScript
                'php', -- PHP
                'chrome', -- JavaScript, TypeScript, Vue (using Chrome)
                -- Add more debuggers corresponding to the LSPs you use
            },
        }

        -- Setup DAP UI
        dapui.setup {
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                icons = {
                    pause = '⏸',
                    play = '▶',
                    step_into = '⏎',
                    step_over = '⏭',
                    step_out = '⏮',
                    step_back = 'b',
                    run_last = '▶▶',
                    terminate = '⏹',
                    disconnect = '⏏',
                },
            },
        }

        -- Automatically open and close DAP UI during debugging sessions
        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close

        -- Go-specific configuration
        require('dap-go').setup {
            delve = {
                detached = vim.fn.has 'win32' == 0,
            },
        }

        -- Python configuration (ensure 'debugpy' is installed via Mason)
        dap.adapters.python = {
            type = 'executable',
            command = 'python',
            args = { '-m', 'debugpy.adapter' },
        }
        dap.configurations.python = {
            {
                type = 'python',
                request = 'launch',
                name = 'Launch file',
                program = "${file}",
                pythonPath = function()
                    return 'python' -- Adjust this path if needed
                end,
            },
        }

        -- Node.js / TypeScript configuration (ensure 'node2' is installed via Mason)
        dap.adapters.node2 = {
            type = 'executable',
            command = 'node',
            args = { os.getenv('HOME') .. '/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js' },
        }
        dap.configurations.javascript = {
            {
                type = 'node2',
                request = 'launch',
                name = 'Launch file',
                program = '${file}',
                cwd = vim.fn.getcwd(),
                sourceMaps = true,
                protocol = 'inspector',
            },
        }
        dap.configurations.typescript = dap.configurations.javascript

        -- PHP configuration (ensure 'php' is installed via Mason)
        dap.adapters.php = {
            type = 'executable',
            command = 'php-debug-adapter',
            args = {},
        }
        dap.configurations.php = {
            {
                type = 'php',
                request = 'launch',
                name = 'Listen for Xdebug',
                port = 9003,
            },
        }

        -- Chrome (for JavaScript/TypeScript/Vue debugging)
        dap.adapters.chrome = {
            type = "executable",
            command = "node",
            args = { os.getenv("HOME") .. "/.local/share/nvim/mason/packages/chrome-debug-adapter/out/src/chromeDebug.js" },
        }
        dap.configurations.javascriptreact = { -- Add other filetypes if needed
            {
                type = "chrome",
                request = "launch",
                name = "Debug with Chrome",
                url = "http://localhost:3000",
                webRoot = "${workspaceFolder}",
                sourceMaps = true,
                protocol = "inspector",
            },
        }
        dap.configurations.typescriptreact = dap.configurations.javascriptreact
        dap.configurations.vue = dap.configurations.javascriptreact

        -- Add more configurations as needed for other languages
    end,
}
