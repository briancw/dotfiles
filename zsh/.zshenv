# fnm
export PATH=$HOME/.fnm:$PATH
eval "`fnm env`"

# adb
# export PATH=$PATH:~/.android-sdk-macosx/platform-tools/

# Add ~/.local/bin to path if it exists
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
