# dotfiles

同じ開発環境を素早く再構築できるようにするための設定リポジトリです。Homebrew パッケージや Zsh 設定をまとめて管理しています。

プラグインマネージャには [zinit](https://github.com/zdharma-continuum/zinit) を使用しています。

## 構成

```
.zshrc              # エントリポイント（~/dotfiles からシンボリックリンク）
Brewfile            # Homebrew の tap / formula / cask / VS Code 拡張の一覧
install.sh          # ~/.zshrc へのシンボリックリンクを作成
uninstall.sh        # シンボリックリンク・zinit・キャッシュを削除
zsh/
  plugins.zsh       # zinit ブートストラップ・テーマ・プラグイン
  env.zsh           # 環境変数 (PATH, EDITOR 等)
  tools.zsh         # ツール初期化 (rbenv, nodenv, jump)
  options.zsh       # シェルオプション (履歴関連)
  alias.zsh         # エイリアス
```

## 前提条件

1. **Xcode Command Line Tools**: `xcode-select --install`
2. **Homebrew**: 未導入なら公式手順でインストール

## セットアップ手順

```bash
# 1. リポジトリをクローン
git clone git@github.com:EICHAN1208/dotfiles.git ~/dotfiles
cd ~/dotfiles

# 2. Homebrew パッケージを導入
brew bundle install --file Brewfile

# 3. シンボリックリンクを作成
./install.sh

# 4. シェルを再起動（zinit が自動でインストールされる）
exec zsh

# 5. Powerlevel10k の初回設定
p10k configure
```

## アンインストール

dotfiles が作成したファイルを削除してデフォルトの zsh に戻します。

```bash
./uninstall.sh
```

削除対象:
- `~/.zshrc` シンボリックリンク
- `~/.local/share/zinit/`（zinit 本体 + プラグイン）
- `~/.cache/p10k-*`（インスタントプロンプトキャッシュ）

## プラグインの追加・変更

`zsh/plugins.zsh` を編集してください。

```zsh
# oh-my-zsh プラグインの場合
zinit snippet OMZP::プラグイン名

# 外部プラグインの場合
zinit light ユーザー名/リポジトリ名
```

`fzf` や `jump` のように外部コマンドが必要なものは `Brewfile` にも追加してください。

## 運用メモ

- **Brewfile 更新**: `brew update && brew upgrade` 後に `brew bundle dump --file Brewfile --force`
- **設定の即時反映**: `source ~/.zshrc`
- **zinit の更新**: `zinit self-update && zinit update --all`
