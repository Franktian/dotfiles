# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Personal dotfiles for macOS. Files are symlinked from this repo to `$HOME` using `ln`.

## Files

- `.zshrc` — Zsh config: Oh My Zsh with starship prompt, lazy-loaded nvm/rbenv, bun, fzf, Homebrew, cached completions; sources optional `~/.zshrc.local` for per-machine overrides
- `.vimrc` — Vim config: CtrlP fuzzy finder, relative line numbers, sensible defaults
- `.zprofile` — Login shell PATH additions (Obsidian)
- `install.sh` — Symlinks the files above into `$HOME` (backing up existing ones) and generates cached init scripts

## Applying Changes

Bootstrap or refresh a machine (idempotent):
```
~/dotfiles/install.sh
```

Reload shell config after `.zshrc` changes:
```
source ~/.zshrc
```

## Key Paths

- Neovim: Homebrew (`brew install neovim`)
- Homebrew: `/opt/homebrew/bin/brew` (Apple Silicon) or `/usr/local/bin/brew` (Intel)
- nvm: `~/.nvm`
- bun: `~/.bun`
