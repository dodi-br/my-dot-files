#!/bin/bash

check_xcode_license_approved() {
  echo 'Accepting terms from Xcode license...'

  local has_error=0

  if ! [[ "$(/usr/bin/xcrun clang 2>&1 || true)" =~ 'license' ]]; then
    echo 'skip (already approved)'
    return
  fi

  sudo expect -c '
    set timeout 3
    spawn xcodebuild -license
    expect {
      timeout { exit 2 }
      -exact "for more" {
        send "G"
        exp_continue
      }
      -exact "agree, print, cancel" {
        send "agree\n"
        exp_continue
      }
      -exact "You can view the license agreements" {
        exit 0
      }
    }
  ' > /dev/null || has_error=1

  [ $has_error -eq 1 ] && sudo xcodebuild -license

  echo 'done'
}

p_header "Checking your OS pre requisites"
p_note "sudoing"
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
p_note "Checking for OS updates"
sudo softwareupdate -i -a
p_note "Installing xcode command line tools"
xcode-select --install
p_note "Checking Xcode license"
check_xcode_license_approved