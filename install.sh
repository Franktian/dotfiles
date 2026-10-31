#!/usr/bin/env bash
# Bootstrap dotfiles on a Mac: symlink tracked files and generate cached init scripts.
set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FILES=(.zshrc .vimrc .zprofile)

for f in "${FILES[@]}"; do
  target="$HOME/$f"
  if [[ -L "$target" && "$(readlink "$target")" == "$DOTFILES/$f" ]]; then
    echo "ok       $f"
    continue
  fi
  if [[ -e "$target" || -L "$target" ]]; then
    mv "$target" "$target.backup.$(date +%Y%m%d%H%M%S)"
    echo "backup   $f"
  fi
  ln -s "$DOTFILES/$f" "$target"
  echo "linked   $f"
done

# Cached init scripts (sourced by .zshrc for fast startup). Re-run to refresh.
BREW="$(command -v brew || true)"
[[ -z "$BREW" && -x /opt/homebrew/bin/brew ]] && BREW=/opt/homebrew/bin/brew
[[ -z "$BREW" && -x /usr/local/bin/brew ]] && BREW=/usr/local/bin/brew

[[ -n "$BREW" ]] && "$BREW" shellenv > "$HOME/.brew-shellenv.zsh" && echo "cached   brew shellenv"
command -v starship >/dev/null && starship init zsh > "$HOME/.starship-init.zsh" && echo "cached   starship"
command -v fzf >/dev/null && fzf --zsh > "$HOME/.fzf-shell.zsh" && echo "cached   fzf"
command -v bento >/dev/null && bento completion zsh --silent > "$HOME/.bento-completion.zsh" && echo "cached   bento"
command -v openclaw >/dev/null && openclaw completion --shell zsh > "$HOME/.openclaw-completion.zsh" && echo "cached   openclaw"

echo "Done. Put machine-specific settings in ~/.zshrc.local, then: source ~/.zshrc"
