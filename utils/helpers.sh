#!/bin/bash

# Color Codes & Custom utilities

## Fonts
reset=$(tput sgr0)
bold=$(tput bold)
underline=$(tput sgr 0 1)

## Colors
blue=$(tput setaf 38)
green=$(tput setaf 76)
purple=$(tput setaf 171)
red=$(tput setaf 1)
tan=$(tput setaf 3)

## To check input is empty or not
is_empty() {
if [ $# -eq  0 ]
  then
    return 1
fi
  return 0
}

## To check if binary exists
exists() {
if [ $(type -P $1) ]; then
  return 1
fi
  return 0
}

## To check if file exits or not
file_exists() {
if [ -f "$file" ]
then
	return 1
else
	return 0
fi
}

## To check if directory exits or not
dir_exists() {
  if [ -d "$1" ]; then
    return 0
  else
    return 1
  fi
}

# Custom echo functions

ask() {
  printf "\n${bold}$@${reset}"
}

p_arrow() {
  printf "\n ᐅ $@\n"
}

p_bold() {
  printf "\n${bold}%s${reset}\n" "$@"
}

p_error() {
  printf "\n${red}✖ %s${reset}\n" "$@"
}

p_header() {
  printf "\n${underline}${bold}${green}%s${reset}\n" "$@"
}

p_note() {
  printf "\n${underline}${bold}${blue}Note:${reset} ${blue}%s${reset}\n" "$@"
}

p_success() {
  printf "\n${green}✔ %s${reset}\n" "$@"
}

p_thanks() {
  printf "\n${bold}${purple}$@${reset}\n"
}

p_underline() {
  printf "\n${underline}${bold}%s${reset}\n" "$@"
}

p_warning() {
  printf "\n${tan}ᐅ %s${reset}\n" "$@"
}