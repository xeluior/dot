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

# source other scripts
dotfiles_dir="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
source "${dotfiles_dir}/share/bash-preexec/bash-preexec.sh"
source "${dotfiles_dir}/share/shell-integration.bash"

# setup prompt
if command -v starship >/dev/null; then
  eval "$(starship init bash)"
fi

