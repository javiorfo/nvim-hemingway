# nvim-hemingway
*nvim-hemingway is a minimal Neovim plugin written in Lua for commenting code.*

## Caveats
- This plugin has been developed on and for Linux following open source philosophy.

## Overview
| Feature | nvim-hemingway | NOTE |
| ------- | ------------- | ---- |
| Single comment | :heavy_check_mark: | Set by `HemingwayComment` |
| Multiline comment | :heavy_check_mark: | Set by `HemingwayMultiComment` |
| Comment on Normal Mode | :heavy_check_mark: | Using `HemingwayComment` |
| Comment on Visual Mode | :heavy_check_mark: | Using `HemingwayMultiComment` |
| Comment on Insert Mode | :x: |  |
| Undo comment | :heavy_check_mark: | Executing the same command over a commented line |
| Supported filetypes | :heavy_check_mark: | [Check this file](https://github.com/javiorfo/nvim-hemingway/blob/master/lua/hemingway.lua) |
| Add comment to filetype not included | :heavy_check_mark: | By the `setup` function |

## Installation
`Packer`
```lua
use {
    'javiorfo/nvim-hemingway',
    requires = 'javiorfo/nvim-popcorn'
}
```
`Lazy`
```lua
{
    'javiorfo/nvim-hemingway', lazy = true,
    dependencies = { 'javiorfo/nvim-popcorn' }
}
```

## Usage
- Set mappings in *init.vim* or *init.lua*
```lua
local opts = { noremap = true, silent = true }

-- Normal mode 
vim.api.nvim_set_keymap('n', '<leader>co', '<Plug>HemingwayComment', opts)
-- Visual mode
vim.api.nvim_set_keymap('v', '<leader>co', '<Plug>HemingwayMultiComment<CR>', opts)
```
- Executing the map corresponding to `HemingwayComment` with the cursor in a specific line, it will comment the aforementioned line with the corresponding **comment string** of the file.
- In **VISUAL MODE**. Executing the map corresponding to `HemingwayMultiComment` with the cursor in a specific line or multiple lines will comment the aforementioned line (or lines) with the **comment string** of the file.
- Executing any of these commands in a commented line  will uncomment that line (or lines)
- The main strings used for comments are the ones taken from [this file](https://github.com/javiorfo/nvim-hemingway/blob/master/lua/hemingway.lua). If there is no value for the file you are using, you can set it in your personal Neovim init.lua:
```lua
-- Depending on the filetype comment style
require'hemingway'.add_comments{
    myfiletype1 = { single = "** " },
    myfiletype2 = { left = "*|* ", right = " *|*" },
    myfiletype3 = { single = "** ", left = "*|* ", right = " *|*"  },
}
```
- To see commentary info about the current file, execute command line `:HemingwayInfo`

## Screenshots
### Comments in Java and XML files:

<img src="https://github.com/javiorfo/img/blob/master/nvim-hemingway/hemingway.gif?raw=true" alt="lua comments" style="width:800px;"/>

**NOTE:** The colorscheme **malt** from [nvim-whisky](https://github.com/javiorfo/nvim-whisky) is used in these images.
