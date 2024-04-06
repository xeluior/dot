[[ -s /etc/bashrc ]] && source /etc/bashrc

shopt -s \
  autocd \
  dotglob \
  direxpand \
  globstar \
  histappend \
  histverify \
  no_empty_cmd_completion

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

# my module system
plugins=(nvm fzf bash-preexec starship shell-integration)
source "$XDG_DATA_HOME/modbash/mod.bash"
