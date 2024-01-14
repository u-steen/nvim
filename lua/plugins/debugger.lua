return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            require("dapui").setup()

            -- setup codelldb
            dap.adapters.codelldb = {
                type = 'server',
                port = "${port}",
                executable = {
                    -- CHANGE THIS to your path!
                    command = '/home/iustin/codelldb/extension/adapter/codelldb',
                    args = { "--port", "${port}" },

                    -- On windows you may have to uncomment this:
                    -- detached = false,
                }
            }
            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "codelldb",
                    request = "launch",
                    program = function()
                        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = '${workspaceFolder}',
                    stopOnEntry = false,
                },
            }
            -- porting the config to c and rust
            dap.configurations.c = dap.configurations.cpp
            dap.configurations.rust = dap.configurations.cpp

            -- DapUi config
            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end


            controls = {
                element = "repl",
                enabled = true,
                icons = {
                    disconnect = "",
                    pause = "",
                    play = "",
                    run_last = "",
                    step_back = "",
                    step_into = "",
                    step_out = "",
                    step_over = "",
                    terminate = ""
                },
                layouts = { {
                    elements = { {
                        id = "scopes",
                        size = 0.25
                    }, {
                        id = "breakpoints",
                        size = 0.25
                    }, {
                        id = "watches",
                        size = 0.50
                    } },
                    position = "left",
                    size = 40
                }, {
                    elements = { {
                        id = "repl",
                        size = 0.5
                    }, {
                        id = "console",
                        size = 0.5
                    } },
                    position = "bottom",
                    size = 10
                } },
                mappings = {
                    edit = "e",
                    expand = { "<CR>", "<2-LeftMouse>" },
                    open = "o",
                    remove = "d",
                    repl = "r",
                    toggle = "t"
                },
            }


            -- Keybindings
            vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end)
            vim.keymap.set('n', '<leader>dc', function() dap.continue() end)
            vim.keymap.set('n', '<leader>dt', function() dapui.toggle() end)
            vim.keymap.set('n', '<leader>de', function() dapui.eval() end)
        end
    },
}
