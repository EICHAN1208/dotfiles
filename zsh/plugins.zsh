# zinit のブートストラップ（未インストール時に自動インストール）
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -d "$ZINIT_HOME" ]]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# テーマ: powerlevel10k (Warp 以外のターミナルでのみ有効)
if [[ "$TERM_PROGRAM" != "WarpTerminal" ]]; then
  zinit ice depth=1
  zinit light romkatv/powerlevel10k
fi

# oh-my-zsh ライブラリ（プラグインの前提）
zinit snippet OMZL::git.zsh
zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::directories.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::theme-and-appearance.zsh

# oh-my-zsh プラグイン
zinit snippet OMZP::git
zinit snippet OMZP::rails
zinit snippet OMZP::terraform
zinit snippet OMZP::fzf

# 外部プラグイン
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-syntax-highlighting
