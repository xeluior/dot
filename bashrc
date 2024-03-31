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
