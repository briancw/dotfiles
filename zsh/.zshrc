# Compinit
zstyle :compinstall filename "${HOME}/.zshrc"
autoload -Uz compinit
compinit

# Setup zinit
ZINIT_HOME="${HOME}/.local/share/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Options
#setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
#setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt inc_append_history                                       # save commands are added to the history immediately, otherwise only when shell exits.
setopt histignorespace                                          # Don't save commands that start

WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' accept-exact '*(N)'

# Add plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-syntax-highlighting

# History
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=1000
bindkey -e

# Colors
autoload -U colors
colors
export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
alias ls='ls $LS_OPTIONS'

# Keybinds
# create a zkbd compatible hash. To add other keys to this hash, see: man 5 terminfo
typeset -A key
key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}
key[ControlLeft]=${terminfo[kLFT5]}
key[ControlRight]=${terminfo[kRIT5]}
key[Delete]=${terminfo[kdch1]}

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char
[[ -n "${key[ControlLeft]}"  ]]  && bindkey  "${key[ControlLeft]}"  backward-word
[[ -n "${key[ControlRight]}" ]]  && bindkey  "${key[ControlRight]}" forward-word

# This makes home and end work somehow
function zle-line-init () {echoti smkx}
function zle-line-finish () {echoti rmkx}
zle -N zle-line-init
zle -N zle-line-finish

# Path
path+=("$HOME/.local/bin")
path+=("$HOME/.bun")
path+=("$HOME/.bun/bin")
path+=("$HOME/go/bin")
eval "$(fnm env --shell zsh)"

# aliases
source "$HOME/.aliases"

# Oh my posh
eval "$(oh-my-posh init zsh --config $HOME/.oh-my-posh/zen.yaml)"

# editor
export EDITOR=nano
