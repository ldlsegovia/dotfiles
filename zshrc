# enable antigen
source /usr/local/share/antigen/antigen.zsh

# Load oh-my-zsh
antigen use oh-my-zsh

# Bundles
antigen bundles <<EOBUNDLES
  git
  gem
  heroku
  osx
  fasd
  thefuck

  mafredri/zsh-async
  zsh-users/zsh-completions
  zsh-users/zsh-autosuggestions
  sindresorhus/pure

  # these should be at last!
  zsh-users/zsh-syntax-highlighting
  zsh-users/zsh-history-substring-search
EOBUNDLES

# Apply antigen
antigen apply

# bind UP and DOWN arrow keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Key bindings
bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word

# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# History settings
HISTFILE=~/.zhistory
HISTSIZE=100000
SAVEHIST=100000

# Don't show duplicate history entires
setopt hist_find_no_dups

# Remove unnecessary blanks from history
setopt hist_reduce_blanks

# Share history between instances
setopt share_history

setopt hist_ignore_space

# Enable extended globbing
setopt extendedglob
setopt no_nomatch

# Init rbenv and nodenv
eval "$(rbenv init -)"
eval "$(nodenv init -)"

# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"
export PATH=".git/safe/../../node_modules/.bin:$PATH"

# functions
if [ -d ~/.bash_functions ]; then
  for file in ~/.bash_functions/*; do
    . "$file"
  done
fi

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases
