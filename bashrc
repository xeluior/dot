[[ -s /etc/bashrc ]] && source /etc/bashrc

shopt -s \
  autocd \
  dotglob \
  direxpand \
  globstar \
  histappend \
  histverify \
  no_empty_cmd_completion

[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh" 
[[ -r "${NVM_DIR}/bash_completion" ]] && source "${NVM_DIR}/bash_completion"

alias \
  ls='ls -AFhlrt --color=auto --group-directories-first' \
  dd='dd status=progress' \
  mkdir='mkdir -pv' \
  cp='cp -iv' \
  mv='mv -iv' \
  rm='rm -Idvr' \
  ln='ln -iv' \
  du='du -chs' \
  echo='echo -e' \
  sqlite3='sqlite3 -init "${XDG_CONFIG_HOME}/sqlite3/sqliterc"' \
  wget='wget --hsts-file="${XDG_STATE_HOME}/wget-hsts"' \
  lzg='lazygit' \
  :q='exit'

# fzf (as vendored in fedora)
fzf_ext=/usr/share/fzf/shell/key-bindings.bash
[[ -r "$fzf_ext" ]] && source "$fzf_ext"

# source last
dotfiles_dir="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
source "${dotfiles_dir}/share/bash-preexec/bash-preexec.sh"
type starship &>/dev/null && eval "$(starship init bash)"
source "${dotfiles_dir}/share/shell-integration.bash"
