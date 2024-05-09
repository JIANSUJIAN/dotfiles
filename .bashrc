# Git auto-completion
if [ -f /opt/homebrew/Cellar/git/2.44.0/share/git-core/contrib/completion/git-completion.bash ]; then
	  . /opt/homebrew/Cellar/git/2.44.0/share/git-core/contrib/completion/git-completion.bash
fi

# poetry auto-loaded autocompletion
poetry completions bash >> ~/.bash_completion



eval "$(register-python-argcomplete pipx)"
# source ~/opt/anaconda3/etc/profile.d/conda.sh
# conda activate myenv

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


 # Fzf does not use ripgrep by default, so we need to tell fzf to use ripgrep by defining a FZF_DEFAULT_COMMAND variable. 

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m'
fi

# Pyenv
#
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# aws aliases
alias aws_dev='export AWS_PROFILE=jian-dev AWS_REGION=us-east-1 && aws configure list &> /dev/null || aws sso login'
# alias aws_qa='export AWS_PROFILE=qa AWS_REGION=us-east-1 && aws configure list &> /dev/null || aws sso login'
# alias aws_prod='export AWS_PROFILE=prod AWS_REGION=us-east-1 && aws configure list &> /dev/null || aws sso login'


# to have it automatically sourced upon login
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# direnv
eval "$(direnv hook bash)"

# asdf
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

# dotfiles management
alias config='/usr/bin/git --git-dir=/Users/jiansu/.cfg/ --work-tree=/Users/jiansu'
