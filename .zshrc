# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# NOTE: Warp ターミナルでは p10k が不要なため無効化中。戻す場合はコメントを外す。
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

SCRIPT_DIR=$HOME/dotfiles

source $SCRIPT_DIR/zsh/plugins.zsh
source $SCRIPT_DIR/zsh/env.zsh
source $SCRIPT_DIR/zsh/tools.zsh
source $SCRIPT_DIR/zsh/options.zsh
source $SCRIPT_DIR/zsh/alias.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# NOTE: Warp ターミナルでは p10k が不要なため無効化中。戻す場合はコメントを外す。
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
