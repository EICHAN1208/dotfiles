# oh-my-zsh の設定
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Oh My Zsh のプラグイン: https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins
plugins=(
  git
  rails
  terraform
  fzf
  # https://github.com/zsh-users/zsh-autosuggestions
  zsh-autosuggestions
  # https://github.com/zsh-users/zsh-syntax-highlighting
  zsh-syntax-highlighting
  docker
)

source $ZSH/oh-my-zsh.sh
