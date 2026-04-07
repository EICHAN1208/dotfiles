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

## Brewfile の運用

### 構成

Brewfile には以下の 4 種類のエントリが含まれています。

| 種類 | 記法例 | 説明 |
|---|---|---|
| tap | `tap "hashicorp/tap"` | サードパーティのリポジトリ |
| formula | `brew "fzf"` | CLI ツール |
| cask | `cask "google-cloud-sdk"` | GUI アプリ |
| VS Code 拡張 | `vscode "github.copilot"` | VS Code の拡張機能 |

### よく使うコマンド

```bash
# Brewfile の内容を一括インストール
brew bundle install --file Brewfile

# 現在の環境から Brewfile を生成（上書き）
brew bundle dump --file Brewfile --force

# Brewfile に記載がないパッケージを一覧表示
brew bundle cleanup --file Brewfile

# Brewfile に記載がないパッケージを実際に削除
brew bundle cleanup --file Brewfile --force

# Brewfile の内容がすべてインストール済みか確認
brew bundle check --file Brewfile

# VS Code 拡張のみインストール
brew bundle install --file Brewfile --no-brew --no-cask

# パッケージの更新後に Brewfile を同期
brew update && brew upgrade && brew bundle dump --file Brewfile --force
```

### 運用の流れ

1. **パッケージを追加したとき**: `brew install <pkg>` 後に `brew bundle dump --file Brewfile --force` で Brewfile に反映
2. **不要なパッケージを整理したいとき**: `brew bundle cleanup --file Brewfile` で Brewfile にないパッケージを確認し、`--force` で削除
3. **新しいマシンをセットアップするとき**: `brew bundle install --file Brewfile` で一括インストール

## 運用メモ

### 設定の即時反映

`zsh/` 配下のファイルを編集した後、新しいシェルを開かなくても現在のセッションに反映できます。

```bash
source ~/.zshrc
```

ただし、zinit のプラグイン追加・削除を行った場合は `exec zsh` でシェルを再起動した方が確実です。

### zinit の更新

zinit 本体とインストール済みプラグインをまとめて最新版に更新します。

```bash
# zinit 本体の更新
zinit self-update

# 全プラグインの更新
zinit update --all

# まとめて実行
zinit self-update && zinit update --all
```

### dotfiles の変更を反映

他のマシンで行った変更を取り込む場合:

```bash
cd ~/dotfiles
git pull origin main
source ~/.zshrc
```
