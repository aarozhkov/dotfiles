# NVIM lua

## Search

* Files by name
* Open buffers
* Git commits
* Git commits for current File
* Symbol(word under cursor = #/*) search in current file 


## LSP

* LSP References in float window(TElecope)
* Formatters/linters for l_servers without support(null ls)
* Code actions chooser(Telescope)


## Languages

* yamlls f/l
* jsonls
* terraform
* python
* go
* javascript

## Git integration

* Changes column - Gitsigns
* Blame - Gitsigns virtual text(feature can be toggled) or Popup
* Stage work:
  * Stage/unstage hunks(code parts) - Gitsigns
  * Stage UI - TODO
  * Staged/Unstaged Diff UI - TODO
* Git log - Telescope?
* Git branches:
  * observe branches - Telescope?
  * change branches - Telescope?
* Git push/pull
* Git merge tool - like fugitive?

## Misc

### File explorer(Nvim-Tree)

Why README underscored? TODO - delete underscore


### Colorscheme

Tokyonight - make more contrast for Nvim-Tree git hl. NvimTreeGitDirty and other color tegs customize


### Which Key

This tool have separated keybindings configuration. Which applyes globally

Have handy modes:
* show registers - works prefect!
* marks - i don't use it but can be usefull
* spelling - Cool!! TODO: NEED to implement good spelling engine for Eng and Rus

### Not sorted
* Key supporter. Dash with keys
* Status line
* Tree like file browser. Need development tools(+ libstdc++ static, gcc-c++ ) to build/install language plugins
* Commenter
* Git blame floating/ git blame side-to-side
* Git log
* Git commands: commit, push, etc


