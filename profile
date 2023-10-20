export QT_STYLE_OVERRIDE=kvantum

# for i3 compatibility
export TERMINAL="alacritty"

# oh man all these vars for xdg compatibility
export XDG_DATA_HOME="${HOME}/.local/share"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export GRADLE_USER_HOME="${XDG_DATA_HOME}/gradle"
export GOPATH="${XDG_DATA_HOME}/go"
export PYTHONUSERBASE="${XDG_DATA_HOME}/python"

export XDG_CACHE_HOME="${HOME}/.cache"
export ICEAUTHORITY="${XDG_CACHE_HOME}/ICEauthority"
export CUDA_CACHE_PATH="${XDG_CACHE_HOME}/nv"
export RANDFILE="${XDG_CACHE_HOME}/openssl/rnd"
export GOMODCACHE="${XDG_CACHE_HOME}/go/mod"
export PYTHONPYCACHEPREFIX="${XDG_CACHE_HOME}/python"

export XDG_STATE_HOME="${HOME}/.local/state"
export HISTFILE="${XDG_STATE_HOME}/bash_history"
export LESSHISTFILE="${XDG_STATE_HOME}/lesshst"
export WINEPREFIX="${XDG_STATE_HOME}/wine/default"
export NODE_REPL_HISTORY="${XDG_STATE_HOME}/node_repl_history"
export SQLITE_HISTORY="${XDG_CACHE_HOME}/sqlite_history"

export XDG_CONFIG_HOME="${HOME}/.config"
export XINITRC="${XDG_CONFIG_HOME}/X11/xinitrc"
export KDEHOME="${XDG_CONFIG_HOME}/kde"
export PYTHONSTARTUP="${XDG_CONFIG_HOME}/python/startup.py"
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/npmrc"
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"
export NVM_DIR="${XDG_CONFIG_HOME}/nvm"
export WGETRC="${XDG_CONFIG_HOME}/wgetrc"

export GHCUP_USE_XDG_DIRS=true

# ensure PATH has all extensions
if [ -d "${CARGO_HOME}/bin" ]; then
  case ":${PATH}:" in
    *:${CARGO_HOME}/bin:*) ;;
    *) PATH="${CARGO_HOME}/bin:${PATH}";;
  esac
fi

if [ -d "${GOPATH}/bin" ]; then
  case ":${PATH}:" in
    *:${GOPATH}/bin:*) ;;
    *) PATH="${GOPATH}/bin:${PATH}";;
  esac
fi

if [ -d "${HOME}/.local/bin" ]; then
  case ":${PATH}:" in
    *:${HOME}/.local/bin:*) ;;
    *) PATH="${HOME}/.local/bin:${PATH}";;
  esac
fi
export PATH

# aliases
alias ls='ls -lhAF --color=auto'
alias mkdir='mkdir -p'
alias irssi='irssi --config="${XDG_CONFIG_HOME}/irssi/config" --home="${XDG_DATA_HOME}/irssi"'
alias sqlite3='sqlite3 -init "${XDG_CONFIG_HOME}/sqlite3/sqliterc"'
alias wget='wget --hsts-file="${XDG_STATE_HOME}/wget-hsts"'

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# define EDITOR in decreasing order of preference
if command -v lvim >/dev/null; then
  EDITOR="lvim"
elif command -v nvim >/dev/null; then
  EDITOR="nvim"
elif command -v vim >/dev/null; then
  EDITOR="vim"
else
  EDITOR="vi"
fi
export EDITOR

