# -------------------------
# some useful options (man zshoptions)
# -------------------------

setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef # Disable ctrl-s to freeze terminal
# zle_highlight=('paste:none')


# -------------------------
# completions
# -------------------------

autoload -Uz compinit bashcompinit
zstyle ':completion:*' menu select
# zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
compinit
bashcompinit
_comp_options+=(globdots)		# Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

eval "$(pandoc --bash-completion)"
source /usr/share/bash-completion/completions/pacstall

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip
# pip zsh completion end

# -------------------------
# Colors
# -------------------------
autoload -Uz colors && colors


# -------------------------
# History
# -------------------------
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# -------------------------
# Useful Functions
# -------------------------
source "$ZDOTDIR/zsh-functions"

# # Normal files to source
zsh_add_file "zsh-exports"
# zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-keybinds"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

# # Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
# zsh_add_plugin "hlissner/zsh-autopair"
# zsh_add_completion "esc/conda-zsh-completion" false
# # For more plugins: https://github.com/unixorn/awesome-zsh-plugins
# # More completions https://github.com/zsh-users/zsh-completions

# # FZF 
# # TODO update for mac
# [ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
# [ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
# [ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh
# [ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# [ -f $ZDOTDIR/completion/_fnm ] && fpath+="$ZDOTDIR/completion/"
# # export FZF_DEFAULT_COMMAND='rg --hidden -l ""'


#---------OLD ZSH PROMPT-----------

# Load stuff
# autoload -U promptinit && promptinit

# Load version control information
# autoload -Uz vcs_info
# precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
# zstyle ':vcs_info:git:*' formats '(%b)'

# Set up the prompt (with git branch name)
# setopt PROMPT_SUBST
# PROMPT='%B%{$fg[red]%}%n : ${PWD/#$HOME/~} %{$fg[yellow]%}${vcs_info_msg_0_}%{$reset_color%}
# $ '

# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
# # pnpm
# export PNPM_HOME="/home/shikhar/.local/share/pnpm"
# case ":$PATH:" in
#   *":$PNPM_HOME:"*) ;;
#   *) export PATH="$PNPM_HOME:$PATH" ;;
# esac
# # pnpm end

source /home/shikhar/.venv/bin/activate
