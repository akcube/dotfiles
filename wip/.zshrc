plugins=(zsh-autosuggestions zsh-syntax-highlighting)
export ZSH="$HOME/.oh-my-zsh"

SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  battery       # Battery level and status
  line_sep      # Line break
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  venv          # virtualenv section
  conda         # conda virtualenv section
  exec_time     # Execution time
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_TIME_SHOW=true
SPACESHIP_TIME_12HR=true
SPACESHIP_TIME_FORMAT="%w,%@"
SPACESHIP_TIME_PREFIX=""
SPACESHIP_TIME_SUFFIX="\n"
SPACESHIP_TIME_COLOR=#af87ff

SPACESHIP_BATTERY_PREFIX="\033[A\033[15C"
SPACESHIP_BATTERY_SUFFIX="\n"
SPACESHIP_BATTERY_THRESHOLD=15
SPACESHIP_BATTERY_SYMBOL_DISCHARGING=" !! ⛫ " 
SPACESHIP_BATTERY_SYMBOL_CHARGING="  "

SPACESHIP_DIR_TRUNC_PREFIX="…/"
SPACESHIP_DIR_COLOR=#87ffff
SPACESHIP_DIR_PREFIX=""

SPACESHIP_PROMPT_ADD_NEWLINE=true
SPACESHIP_PROMPT_SEPARATE_LINE=false

SPACESHIP_GIT_BRANCH_COLOR=#5fff87
SPACESHIP_GIT_STATUS_SHOW=false

SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_NODE_SHOW=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_ELM_SHOW=false
SPACESHIP_ELIXIR_SHOW=false
SPACESHIP_XCODE_SHOW_LOCAL=false
SPACESHIP_SWIFT_SHOW_LOCAL=false
SPACESHIP_GOLANG_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_RUST_SHOW=false
SPACESHIP_HASKELL_SHOW=false
SPACESHIP_JULIA_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_PYTHON_SHOW=false
SPACESHIP_DOTNET_SHOW=false
SPACESHIP_EMBER_SHOW=false
SPACESHIP_KUBECTL_SHOW=false
SPACESHIP_GRADLE_SHOW=false
SPACESHIP_MAVEN_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_IBMCLOUD_SHOW=false

source /usr/lib/spaceship-prompt/spaceship.zsh
source $ZSH/oh-my-zsh.sh

export BAT_THEME="OneHalfDark"

alias cat="bat"
alias real_cat="/usr/bin/cat"

#### ------------------------------
#### Custom time command
#### ------------------------------
if [[ `uname` == Darwin ]]; then
    MAX_MEMORY_UNITS=KB
else
    MAX_MEMORY_UNITS=MB
fi

TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'\n'\
'avg shared (code):         %X KB'$'\n'\
'avg unshared (data/stack): %D KB'$'\n'\
'total (sum):               %K KB'$'\n'\
'max memory:                %M '$MAX_MEMORY_UNITS''$'\n'\
'page faults from disk:     %F'$'\n'\
'other page faults:         %R'

#### ------------------------------
#### exa - Color Scheme Definitions
#### ------------------------------

export LS_COLORS="$(vivid generate dracula)"
export EXA_COLORS="ur=35:gr=35:tr=35:uw=31:gw=31:tw=31:ux=36:ue=36:gx=36:tx=36:sn=32:sb=32:uu=36:gu=37:lc=33:lm=33:da=35:"
alias ls="exa --icons --group --sort=.name --group-directories-first"
alias ll="ls -alh"
alias vpn-iiit="sudo openvpn --config ~/.iiit.ovpn"

#### ------------------------------
#### Perf commands
#### ------------------------------
record(){
  perf record -g
}

report(){
  perf report -g 'graph,0.5,caller'
}

