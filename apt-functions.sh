set -eo pipefail; [[ $TRACE ]] && set -x && export TRACE=$TRACE

export APTFILE_COLOR_OFF="\033[0m"   # unsets color to term fg color
export APTFILE_RED="\033[0;31m"      # red
export APTFILE_GREEN="\033[0;32m"    # green
export APTFILE_YELLOW="\033[0;33m"   # yellow
export APTFILE_MAGENTA="\033[0;35m"  # magenta
export APTFILE_CYAN="\033[0;36m"     # cyan

logfile=package-install
TMP_APTFILE_LOGFILE=$(mktemp "/tmp/${logfile}.XXXXXX") || {
  log_fail "${APTFILE_RED}WARNING: Cannot create temp file using mktemp in /tmp dir ${APTFILE_COLOR_OFF}\n"
}
export TMP_APTFILE_LOGFILE="$TMP_APTFILE_LOGFILE"
trap 'rm -rf "$TMP_APTFILE_LOGFILE" > /dev/null' INT TERM EXIT

log_fail() {
  [[ $TRACE ]] && set -x
  echo -e "${APTFILE_RED}$*${APTFILE_COLOR_OFF}" 1>&2
  [[ -f "$TMP_APTFILE_LOGFILE" ]] && echo -e "verbose logs:\n" 1>&2 && sed -e 's/^/     /' "$TMP_APTFILE_LOGFILE"
  exit 1
}

log_info() {
  [[ $TRACE ]] && set -x
  echo -e "$@"
}

update() {
  [[ $TRACE ]] && set -x
  log_info "Running update"
  sudo apt-get update > "$TMP_APTFILE_LOGFILE" 2>&1
  [[ $? -eq 0 ]] || log_fail "Failed to run update"
}

package() {
  [[ $TRACE ]] && set -x
  [[ -z $1 ]] && log_fail "Please specify a package to install"
  local pkg="$1"
  sudo dpkg --force-confnew -s "$pkg" > "$TMP_APTFILE_LOGFILE" 2>&1 && log_info "${APTFILE_CYAN}[OK]${APTFILE_COLOR_OFF} package $pkg" && return 0
  sudo apt-get -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confnew" -qq -y install "$pkg"
  [[ $? -eq 0 ]] || log_fail "${APTFILE_RED}[FAIL]${APTFILE_COLOR_OFF} package $pkg"
  log_info "${APTFILE_GREEN}[NEW]${APTFILE_COLOR_OFF} package $pkg"
}

ppa() {
  [[ $TRACE ]] && set -x
  [[ -z $1 ]] && log_fail "Please specify a repository to setup"
  local repo="$1"
  if [[ -d /etc/apt/sources.list.d/ ]]; then
    grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep -q "$repo" && log_info "${APTFILE_CYAN}[OK]${APTFILE_COLOR_OFF} ppa $repo" && return 0
  fi
  repository "ppa:$1"
}

key() {
  [[ $TRACE ]] && set -x
  [[ -z $1 ]] && log_fail "Please specify a key to add"
  local key="$1"
  curl -fsSL "$key" | sudo apt-key add -
  log_info "${APTFILE_CYAN}[OK]${APTFILE_COLOR_OFF} key $key"
}

repository() {
  [[ $TRACE ]] && set -x
  [[ -z $1 ]] && log_fail "Please specify a repository to setup"
  local repo="$1"
  if [[ -d /etc/apt/sources.list.d/ ]]; then
    grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep -Fq "$repo" && log_info "${APTFILE_CYAN}[OK]${APTFILE_COLOR_OFF} repository $repo" && return 0
  fi
  sudo add-apt-repository -y "$repo" > "$TMP_APTFILE_LOGFILE" 2>&1
  [[ $? -eq 0 ]] || log_fail "${APTFILE_RED}[FAIL]${APTFILE_COLOR_OFF} repository $pkg"
  update
  log_info "${APTFILE_GREEN}[NEW]${APTFILE_COLOR_OFF} repository $repo"
}

debconf_selection() {
  [[ $TRACE ]] && set -x
  [[ -z $1 ]] && log_fail "Please specify a debconf line"
  echo "$1" | sudo debconf-set-selections
  [[ $? -eq 0 ]] || log_fail "${APTFILE_RED}[FAIL]${APTFILE_COLOR_OFF} debconf: $1"
  log_info "${APTFILE_CYAN}[OK]${APTFILE_COLOR_OFF} set debconf line: $1"
}
