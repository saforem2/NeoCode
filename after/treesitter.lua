require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        custom_captures = {
            -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
            ["foo.bar"] = "Identifier",
        },
        -- Setting this to true or a list of languages will run `:h syntax` and tree-sitter at the same time.
        additional_vim_regex_highlighting = true,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
        },
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
        persist_queries = false, -- Whether the query persists across vim sessions
        keybindings = {
            toggle_query_editor = 'o',
            toggle_hl_groups = 'i',
            toggle_injected_languages = 't',
            toggle_anonymous_nodes = 'a',
            toggle_language_display = 'I',
            focus_language = 'f',
            unfocus_language = 'F',
            update = 'R',
            goto_node = '<cr>',
            show_help = '?',
        },
    },
    query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = {"BufWrite", "CursorHold"},
    },
    rainbow = {
        enable = true,
        colors = {"#65FFDA", "#FFFF00",  "#B2FF59", "#FF4081", "#0CF",  "#E040FB", "#FD971F"}, -- table of hex strings
        --extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
        -- max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
        -- colors = {"#65FFDA", "#FFFF00",  "#B2FF59", "#FF4081", "#0CF",  "#E040FB", "#FD971F"}, -- table of hex strings
        -- termcolors = {}, -- table of colour name strings
    },
    ensure_installed = "maintained"
}
local ts_utils = require'nvim-treesitter.ts_utils'
vim.cmd("hi TSField guifg=#FF03CE")
vim.cmd("hi TSFloat guifg=#87FF00")
vim.cmd("hi TSInclude guifg=#AE81FF")
vim.cmd("hi TSConstant guifg=#FF4081")
