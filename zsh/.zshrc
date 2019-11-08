source "$HOME/.exports"
source "$HOME/.dotfiles/utils/helpers.sh"

ZSH_CUSTOM="$ZSH/custom"

# ZSH theme to display.
ZSH_THEME="spaceship"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Disable marking untracked files as dirty.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# History time stamps
HIST_STAMPS="yyyy-mm-dd"

# Oh-my-zsh plugins
if ! dir_exists "$ZSH_CUSTOM/plugins/zsh-autosuggestions"; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

if ! dir_exists "$ZSH_CUSTOM/plugins/zsh-completions"; then
  git clone https://github.com/zsh-users/zsh-completions.git "$ZSH_CUSTOM/plugins/zsh-completions"
fi

if ! dir_exists "$ZSH_CUSTOM/plugins/zsh-history-substring-search"; then
  git clone https://github.com/zsh-users/zsh-history-substring-search.git "$ZSH_CUSTOM/plugins/zsh-history-substring-search"
fi

if ! dir_exists "$ZSH_CUSTOM/plugins/fast-syntax-highlighting"; then
  git clone https://github.com/zdharma/fast-syntax-highlighting.git "$ZSH_CUSTOM/plugins/fast-syntax-highlighting"
fi

if ! dir_exists "$ZSH_CUSTOM/plugins/yarn-completion"; then
  git clone https://github.com/buonomo/yarn-completion.git "$ZSH_CUSTOM/plugins/yarn-completion"
fi

plugins=(
  git
  cp
  zsh-autosuggestions
  zsh-completions
  zsh-history-substring-search
  fast-syntax-highlighting
  yarn-completion
)

#SPACESHIP_PROMPT_ORDER=(
#  user          # Username section
#  dir           # Current directory section
#  host          # Hostname section
#  git           # Git section (git_branch + git_status)
#  exec_time     # Execution time
#  line_sep      # Line break
#  vi_mode       # Vi-mode indicator
#  jobs          # Background jobs indicator
#  exit_code     # Exit code section
#  char          # Prompt character
#)

#SPACESHIP_RPROMPT_ORDER=( time )
#SPACESHIP_TIME_SHOW=true
#SPACESHIP_DOCKER_SHOW=false
#SPACESHIP_PACKAGE_SHOW=false
#SPACESHIP_NODE_SHOW=false
#SPACESHIP_PHP_SHOW=false
#SPACESHIP_USER_SHOW=true
#SPACESHIP_DIR_SHOW=true

SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_RPROMPT_ORDER=( time )
SPACESHIP_TIME_SHOW=true
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "

#SPACESHIP_DIR_COLOR=000
#SPACESHIP_GIT_BRANCH_COLOR=004

source "$ZSH/oh-my-zsh.sh"