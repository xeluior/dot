# bash options don't hurt in POSIX (HISTFILE is set in the XDG section)
export GLOBIGNORE=".:.."
export HISTCONTROL="ignoreboth:erasedups"
export HISTFILESIZE=
export HISTSIZE=

shopt -s \
  autocd \
  dotglob \
  direxpand \
  globstar \
  histappend \
  histverify \
  no_empty_cmd_completion

source_xdg_data () {
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
pathmunge () {
  case ":${PATH}:" in
    *:"$1":*) ;;
    *)
      if [ "$2" = "after" ] ; then
        PATH=$PATH:$1
      else
        PATH=$1:$PATH
      fi
  esac
}

# source some shit, check those files
source_xdg_data "fzf/shell/key-bindings.bash"
[[ -s "$NVM_DIR/nvm.sh" ]] && \. "$NVM_DIR/nvm.sh" 
[[ -r "${NVM_DIR}/bash_completion" ]] && source "${NVM_DIR}/bash_completion"
dotfiles_dir="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"
source "${dotfiles_dir}/share/bash-preexec/bash-preexec.sh"
if command -v starship >/dev/null; then
  eval "$(starship init bash)"
fi
source "${dotfiles_dir}/share/shell-integration.bash"

pathmunge "${CARGO_HOME}/bin"
pathmunge "${GOPATH}/bin"
pathmunge "/sbin" after
pathmunge "/usr/sbin" after

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
[[ "${TERM}" == "wezterm" ]] && alias imgcat='wezterm imgcat'

# less setup
export LESS="--RAW-CONTROL-CHARS --mouse --wheel-lines=3"
if command -v lesspipe.sh >/dev/null; then
  export LESSOPEN="|lesspipe.sh %s"
fi

export EDITOR="$(which nvim || which vim || which vi)"
