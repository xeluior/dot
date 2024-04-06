# vi: ft=sh
# oh man all these vars for xdg compatibility
export XDG_DATA_HOME="${HOME}/.local/share"
export GNUPGHOME="${XDG_DATA_HOME}/gnupg"
export RUSTUP_HOME="${XDG_DATA_HOME}/rustup"
export CARGO_HOME="${XDG_DATA_HOME}/cargo"
export GRADLE_USER_HOME="${XDG_DATA_HOME}/gradle"
export GOPATH="${XDG_DATA_HOME}/go"
export PYTHONUSERBASE="${XDG_DATA_HOME}/python"
export PYENV_ROOT="${XDG_DATA_HOME}/pyenv"
export GEM_HOME="${XDG_DATA_HOME}/gem"
export RBENV_ROOT="${XDG_DATA_HOME}/rbenv"
export OPAMROOT="${XDG_DATA_HOME}/opam"
export TERMINFO="${XDG_DATA_HOME}/terminfo"
export AWS_DATA_PATH="${XDG_DATA_HOME}/aws"

export XDG_CACHE_HOME="${HOME}/.cache"
export ICEAUTHORITY="${XDG_CACHE_HOME}/ICEauthority"
export CUDA_CACHE_PATH="${XDG_CACHE_HOME}/nv"
export RANDFILE="${XDG_CACHE_HOME}/openssl/rnd"
export GOMODCACHE="${XDG_CACHE_HOME}/go/mod"
export PYTHONPYCACHEPREFIX="${XDG_CACHE_HOME}/python"

export XDG_STATE_HOME="${HOME}/.local/state"
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
export MPLAYER_HOME="${XDG_CONFIG_HOME}/mplayer"
export AWS_CONFIG_FILE="${XDG_CONFIG_HOME}/aws/config"
export AWS_SHARED_CREDENTIALS_FILE="${XDG_CONFIG_HOME}/aws/credentials"
export INPUTRC="${XDG_CONFIG_HOME}/inputrc"

export GHCUP_USE_XDG_DIRS=true

# less setup
export LESS="--RAW-CONTROL-CHARS --mouse --wheel-lines=3"
export LESSHISTFILE="$XDG_STATE_HOME/lesshst"

# set EDITOR to one of the vims
export EDITOR="$(which nvim || which vim || which vi)"
export VISUAL="$EDITOR"

# history settings
export GLOBIGNORE=".:.."
export HISTCONTROL="ignoreboth:erasedups"
export HISTFILE="$XDG_STATE_HOME/bash/history"
export HISTFILESIZE='-1'
export HISTSIZE='-1'

# update path
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

pathmunge "${CARGO_HOME}/bin"
pathmunge "${GOPATH}/bin"

unset -f pathmunge
