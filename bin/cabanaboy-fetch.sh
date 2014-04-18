#!/usr/bin/env bash

_SCRIPT_RESIDENCE="$( cd "$( dirname "$0" )" && pwd )"

echo "tree Fetch running..."
echo ""

if [[ -r $_SCRIPT_RESIDENCE/cabanaboy.config   ]]; then
  echo "Loading $_SCRIPT_RESIDENCE/cabanaboy.conf"
  source $_SCRIPT_RESIDENCE/cabanaboy.conf
elif [[ -r ~/.config/cabanaboy/config   ]]; then
  echo "Loading ~/.config/cabanaboy/config"
  source ~/.config/cabanaboy/config
fi

echo ""

[[ -z $_SSH_HOST ]] && read -erp "Specify the SSH [user@]host: " _SSH_HOST

echo ""

[[ -z $_REMOTE_DIR ]] && read -erp "Specify the top-level remote directory to fetch from: " -i "~/coconuts" _REMOTE_DIR

echo ""

echo "Listing ${_SSH_HOST}:${_REMOTE_DIR}..."
echo $( ssh ${_SSH_HOST} ls "${_REMOTE_DIR}" -FRc1 --color )

echo ""
[[ -z $_TARGET ]] && read -erp "Specify the files to transfer (file globbing works in quotations)? " -i "*" _TARGET

echo ""
[[ -z $_DEST ]] && read -erp "Specify the local destination folder: " -i "~/coconuts" _DEST

echo ""
echo "Shall I fetch with this command?"
_MYCMD="rsync -chauvv --no-perms --no-g ${_SSH_HOST}:${_REMOTE_DIR}/${_TARGET} ${_DEST}"
echo "# $_MYCMD"
read -erp "[Y/n]" -n 1 -t 10 _YN
if [[ $_YN != "n" ]] ; then
  _RESULT="$( ${_MYCMD} )"
else
  exit 0
fi

if [[ ! $_RESULT ]]; then
  exit 0
else
  echo ""
  echo "Shall I delete the remote files I just fetched via rsync?"
  _MYCMD="ssh ${_SSH_HOST}:${_TARGET} cd ${_REMOTE_DIR} && rm -ri ${_TARGET} "
  echo "# $_MYCMD" 
  read -erp "[Y/n]" -n 1 -t 10 _YN

  if [[ $_YN2 != "n" ]]; then
    echo $( ${_MYCMD} )
  else
    exit 0
  fi

  exit 1

fi
