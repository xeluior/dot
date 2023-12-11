# source some shit, check those files
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

if [ -f "${HOME}/.profile" ]; then
  . "$HOME/.profile"
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
