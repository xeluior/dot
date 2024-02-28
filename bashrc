shopt -s \
  autocd \
  dotglob \
  direxpand \
  globstar \
  histappend \
  histverify \
  no_empty_cmd_completion

# source some shit, check those files
if [ -f "${HOME}/.profile" ]; then
  . "${HOME}/.profile"
fi

# custom completions
if [ -d "${XDG_DATA_HOME}/bash-completion/completions" ]; then
  for completion in ${XDG_DATA_HOME}/bash-completion/completions/*; do
    . "${completion}"
  done
fi

if [ -f "${NVM_DIR}/bash_completion" ]; then
  . "${NVM_DIR}/bash_completion"
fi

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
source "${XDG_DATA_HOME}/fzf/shell/completion.bash"

# Key bindings
# ------------
source "${XDG_DATA_HOME}/fzf/shell/key-bindings.bash"

# local bashrc
if [ -r "${XDG_CONFIG_HOME}/bash/rc" ]; then
  source "${XDG_CONFIG_HOME}/bash/rc"
fi
