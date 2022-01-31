# Path to your oh-my-zsh installation.
export ZSH="~/.oh-my-zsh"

# P10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fnm
export PATH=/Users/brian/.fnm:$PATH
eval "`fnm env --multi`"

#adb
# export PATH=$PATH:~/.android-sdk-macosx/platform-tools/