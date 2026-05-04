# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles for macOS. Files are symlinked from this repo to `$HOME` using `ln`.

## Files

- `.zshrc` — Zsh config: Oh My Zsh with `agnoster` theme, nvm, bun, fzf, Homebrew, openclaw completion
- `.vimrc` — Vim config: CtrlP fuzzy finder, relative line numbers, sensible defaults

## Applying Changes

Symlink a file to home:
```
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
```

Reload shell config after `.zshrc` changes:
```
source ~/.zshrc
```

## Key Paths

- Neovim binary: `~/nvim-macos-x86_64/bin`
- Homebrew: `/usr/local/bin/brew`
- nvm: `~/.nvm`
- bun: `~/.bun`
