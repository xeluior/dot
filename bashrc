shopt -s \
  autocd \
  dotglob \
  direxpand \
  globstar \
  histappend \
  histverify \
  no_empty_cmd_completion

# source some shit, check those files
[ -f "${HOME}/.profile" ] && source "${HOME}/.profile"

# custom completions
[ -f "${NVM_DIR}/bash_completion" ] && source "${NVM_DIR}/bash_completion"

# setup prompt
if command -v starship >/dev/null; then
  eval "$(starship init bash)"

  # wrap starship functions for Konsole integration
  PS2='\[\e]133;A\a\]'"$(starship prompt --continuation)"'\[\e]133;B\a\]'
  PS0=${PS0}'\[\e]133;C\a\]'
  starship_wrapper () {
    starship_precmd
    PS1='\[\e]133;L\a\]\[\e]133;A\a\]'$PS1'\[\e]133;B\a\]'
  }
  PROMPT_COMMAND='starship_wrapper'
fi

# Setup fzf
# yoinked from .fzf.bash created by https://github.com/junegunn/fzf/blob/master/install
# ---------
if [[ ! "$PATH" == *${XDG_DATA_HOME}/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}${XDG_DATA_HOME}/fzf/bin"
fi

# Auto-completion
# ---------------
if [ -r "${XDG_DATA_HOME}/fzf/shell/completion.bash" ]; then
  source "${XDG_DATA_HOME}/fzf/shell/completion.bash"
fi

# Key bindings
# ------------
[ -r "${XDG_DATA_HOME}/fzf/shell/key-bindings.bash" ] && source "${XDG_DATA_HOME}/fzf/shell/key-bindings.bash"
[ -r "/usr/share/fzf/shell/key-bindings.bash" ] && source "/usr/share/fzf/shell/key-bindings.bash"

# local bashrc
if [ -r "${XDG_CONFIG_HOME}/bash/rc" ]; then
  source "${XDG_CONFIG_HOME}/bash/rc"
fi
