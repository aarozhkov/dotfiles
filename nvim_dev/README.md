# NVIM configuration

Since NVIM 0.5 implemnt lua as possible editor configuration/extention language.
This repo is all about specific NVIM implementation with lua.

## On Host install

For now NVIM 0.5 dev is used. Not stable.

**For MAC**:
First installation and latest updates from dev follwed by:
`brew install nvim --HEAD`

**For Linux**
TODO


**Configuration**
Download dotfiles and set simlinks.
TODO: use GNU Stow


## TODO

### Global config?

It is a good idea - global config can stands as key-value storage for separate function communication and data flow.

LunarVim use lua table to store all data. It can be stored dynamicaly.


languages keys must be equal buffer filetypes - easy to use it dynamicaly

`lua print(vim.bo.filetype)`

### Null-ls

https://github.com/jose-elias-alvarez/null-ls.nvim
General LSP server. Can mock several LSP apis. 

- formating TODO: conditional formating from python repoconfiguration/project.toml
- code actions

Null-ls have predefined functionality:

Buildins:
- black // formatter + linter
- isort // imports formatter
- yapf // formatter - Primary for personal projects
- autopep8 // fromatter - Primary
- flake8 // style checker + linter - Set complimentary to pyright
- pylint // code analysis + linter

setup:
initial - function config + lsp_config setup
dynamic - function register


Python example:

run null-ls if not runned yet
register python formatter and lineter with null-ls.register function
profit



### Language support

Python:
* Linter - user async lint runners(cant work on the fly) or use LSP integration EFM
* Linters - found right. Flake8 - no errors separation, Pylint - to mach.
* Formatters - find right configuration. Now it is autopep8

Yaml:
* What i dont like.
* identation!!!!. 
* folding
* formattion
* linting.

JSON.
* folding
* identation
* formating

Terraform.


### Worlflows

** Switch to space as leader key? - \ in different places on Macbook and Logitech


**LSP operations in fingers**

* All diagnostics window: telescope lsp_document_diagnostics
* Code actions?



**Git operations in fingers.**
* Git add/remove - work with index
* Git commits
* Blame
* log
* Merges

TBD: gitlab support?

**Markdown operations on fingers**
Problem with control symbols and russian layout
Preview?


**Zettelkasten**
Do not use obsidian in regular work

