# https://z-shell.pages.dev/docs/gallery/collection/plugins#sc-autosuggestions-fast-syntax-highlighting
zi ice wait lucid atinit"ZI[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay"
zi light z-shell/F-Sy-H

zi ice wait lucid atload"!_zsh_autosuggest_start"
zi load zsh-users/zsh-autosuggestions

# ctl + R でコマンド履歴のAND検索
# https://github.com/z-shell/H-S-MW
zstyle ":history-search-multi-word" page-size "11"
zi ice wait lucid
zi load z-shell/H-S-MW
