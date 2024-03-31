shopt -s \
  autocd \
  dotglob \
  direxpand \
  globstar \
  histappend \
  histverify \
  no_empty_cmd_completion

source_xdg_data() {
  # helper function to source a file that could be in one of any dirs in
  # XDG_DATA_DIRS per the freedesktop spec
  target="$1"
  xdg_data_dirs="${XDG_DATA_HOME:-"${HOME}/.local/share"}:${XDG_DATA_DIRS}"
  IFS=':' read -ra directories <<< "${xdg_data_dirs}" 

  for dir in "${directories[@]}"; do
    maybe="${dir}/${target}"
    if [ -r "${maybe}" ]; then
      source "${maybe}"
      return 0
    fi
  done
  return 1
}

# source some shit, check those files
[ -f "${HOME}/.profile" ] && source "${HOME}/.profile"
source_xdg_data "fzf/shell/key-bindings.bash"

# custom completions
[ -f "${NVM_DIR}/bash_completion" ] && source "${NVM_DIR}/bash_completion"

# source other scripts
dotfiles_dir="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
source "${dotfiles_dir}/share/bash-preexec/bash-preexec.sh"

# setup prompt
if command -v starship >/dev/null; then
  eval "$(starship init bash)"
fi

# setup terminal integration
source "${dotfiles_dir}/share/shell-integration.bash"

