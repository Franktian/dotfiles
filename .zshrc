# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH="$HOME/nvim-macos-x86_64/bin:$PATH"

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# Theme disabled here; using starship instead (initialized below, after oh-my-zsh).
ZSH_THEME=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# Skip oh-my-zsh's daily auto-update check (saves ~400ms on every shell start).
# Run `omz update` manually when you want to update.
zstyle ':omz:update' mode disabled

source $ZSH/oh-my-zsh.sh

# starship prompt (cached init for faster startup)
# Regenerate: starship init zsh > ~/.starship-init.zsh
if [[ -f ~/.starship-init.zsh ]]; then
  source ~/.starship-init.zsh
elif command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"

# Homebrew shellenv (cached for faster startup, ~34ms saved)
# Regenerate: /opt/homebrew/bin/brew shellenv > ~/.brew-shellenv.zsh
if [[ -f ~/.brew-shellenv.zsh ]]; then
  source ~/.brew-shellenv.zsh
elif [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

### BEGIN--Instacart Shell Settings. (Updated: Wed  4 Jun 2025 12:20:54 EDT. [Script Version 1.3.27])
# This Line Added Automatically by Instacart Setup Script
# The sourced file contains all of the instacart utilities and shell settings
# To remove this functionality, leave the block, and enter "NO-TOUCH" in the BEGIN line, and comment the line below:
if [ -f /Users/franktian/.instacart_shell_profile ]; then
  # Skip:
  #  - eager nvm load (we lazy-load nvm below)
  #  - insta-setup tab-completion generation (~270ms: forks insta-setup + extra compinit)
  #  - eager rbenv init/rehash (~180ms: stripped via sed; we lazy-load rbenv below)
  INSTACART_SUPPRESS_NVM=true \
  INSTACART_SUPPRESS_SETUP_COMPLETION=true \
    source <(sed '/### BEGIN--Ruby rbenv tool/,/### END--Ruby rbenv tool/d' /Users/franktian/.instacart_shell_profile)
fi
### END--Instacart Shell Settings.

# Lazy-load rbenv: put shims on PATH eagerly so `ruby`/`gem`/`bundle` work,
# but defer `rbenv init -` (and the slow `rbenv rehash`) until first `rbenv` call.
if [ -d "$HOME/.rbenv/shims" ]; then
  export PATH="$HOME/.rbenv/shims:$PATH"
  export RBENV_SHELL=zsh
  rbenv() {
    unset -f rbenv
    eval "$(command rbenv init - --no-rehash zsh 2>/dev/null || command rbenv init -)"
    rbenv "$@"
  }
fi
export NVM_DIR="$HOME/.nvm"
# Lazy-load nvm: shim nvm/node/npm/npx/corepack/yarn/pnpm so the shell starts fast.
# On first invocation, the shims unset themselves, source nvm, and re-dispatch.
# Put the default node bin on PATH so `node`/`npm` work without triggering load.
if [ -s "$NVM_DIR/alias/default" ]; then
  _nvm_default_version="$(command cat "$NVM_DIR/alias/default" 2>/dev/null)"
  # Resolve aliases like "22" -> the highest installed v22.x.x
  if [ -d "$NVM_DIR/versions/node/v$_nvm_default_version" ]; then
    export PATH="$NVM_DIR/versions/node/v$_nvm_default_version/bin:$PATH"
  else
    _nvm_resolved="$(command ls "$NVM_DIR/versions/node" 2>/dev/null | command grep -E "^v${_nvm_default_version}\\." | sort -V | tail -1)"
    [ -n "$_nvm_resolved" ] && export PATH="$NVM_DIR/versions/node/$_nvm_resolved/bin:$PATH"
    unset _nvm_resolved
  fi
  unset _nvm_default_version
fi
_load_nvm() {
  unset -f nvm node npm npx corepack yarn pnpm 2>/dev/null
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
nvm()     { _load_nvm; nvm "$@"; }
# node/npm/npx/corepack/yarn/pnpm are already on PATH from the default version,
# so only shim them as a fallback if no default is installed.
if ! command -v node >/dev/null 2>&1; then
  node()    { _load_nvm; node "$@"; }
  npm()     { _load_nvm; npm "$@"; }
  npx()     { _load_nvm; npx "$@"; }
  corepack(){ _load_nvm; corepack "$@"; }
  yarn()    { _load_nvm; yarn "$@"; }
  pnpm()    { _load_nvm; pnpm "$@"; }
fi

# OpenClaw Completion (cached for faster startup)
# Regenerate with: openclaw completion --shell zsh > ~/.openclaw-completion.zsh
[[ -f ~/.openclaw-completion.zsh ]] && source ~/.openclaw-completion.zsh


# Only alias claude through olive on the work device (where olive is installed)
if command -v olive >/dev/null 2>&1; then
  alias claude="olive claude"
fi

# bun completions
[ -s "/Users/franktian/.bun/_bun" ] && source "/Users/franktian/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Slack CLI (avoid rbenv shim conflict)
alias slack=/opt/homebrew/bin/slack

# tmux-to-cmux shim: fake tmux env so Claude Code uses native split mode
if [[ -n "$CMUX_SURFACE_ID" || "$(ps -o comm= -p $PPID 2>/dev/null)" == *cmux* || -S /tmp/cmux.sock ]]; then
  export TMUX="/tmp/cmux.sock,$$,0"
  export TMUX_PANE="%0"
fi

# cmux claude-teams shortcut
alias ct='cmux claude-teams'

# fzf shell integration (Ctrl+R history, Ctrl+T file picker, Alt+C cd)
# Cached for faster startup. Regenerate: fzf --zsh > ~/.fzf-shell.zsh
if [[ -f ~/.fzf-shell.zsh ]]; then
  source ~/.fzf-shell.zsh
else
  source <(fzf --zsh)
fi

# Claude Code - disable flickering output
export CLAUDE_CODE_NO_FLICKER=1

# >>> gohan setup, do not edit this section <<<
# !! Contents within this block are managed by gohan !!
[ -f "/Users/franktian/.config/gohan/gohan.sh" ] && source "/Users/franktian/.config/gohan/gohan.sh"
# <<< gohan setup end <<<

# BENTO_COMPLETIONS_START
export BENTO_COMPLETIONS_VERSION=2

# compinit already ran via oh-my-zsh; skip the duplicate call here.
# Bento completion cached for faster startup (~100ms saved).
# Regenerate: bento completion zsh --silent > ~/.bento-completion.zsh
if [[ -f ~/.bento-completion.zsh ]]; then
  source ~/.bento-completion.zsh
else
  autoload -U compinit; compinit
  source <(bento completion zsh --silent)
fi
export PGHOST=localhost # Set PGHOST to talk to bento postgres

ava-shell () {
	local tmpfile=$(mktemp);
	trap 'rm -f $tmpfile' EXIT;
	if bento ava shell "$@" --result-file $tmpfile; then
		if [ -e "$tmpfile" ]; then
			local fixed_cmd=$(cat $tmpfile);
			print -z "$fixed_cmd";
		fi
	else
		return 1
	fi
};
alias '?a'='ava-shell';

# BENTO_COMPLETIONS_END
