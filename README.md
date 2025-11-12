# dotfiles

同じ開発環境を素早く再構築できるようにするための設定リポジトリです。Homebrew パッケージや Zsh 設定、Oh My Zsh のカスタムプラグインなどをまとめて管理しています。

## 構成

- `Brewfile` — Homebrew の tap / formula / cask / VS Code 拡張の一覧。
- `deploy.sh` — `~/.zshrc` へのシンボリックリンクを張るセットアップスクリプト。
- `zsh/` — Zsh 設定断片 (`config.zsh`, `alias.zsh`, `functions.zsh`)。
- `oh-my-zsh/custom/plugins/` — `zsh-autosuggestions` などのカスタムプラグインを同梱。

## 前提条件

1. **Xcode Command Line Tools**: `xcode-select --install` で入れておく。
2. **Homebrew**: 未導入なら公式手順で `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"` を実行。

## セットアップ手順

1. **リポジトリを配置**（任意のディレクトリで OK）:
   ```bash
   git clone git@github.com:USERNAME/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```
2. **Homebrew パッケージを導入**:
   ```bash
   brew bundle install --file Brewfile
   ```
   - `openssl@1.1` など終了済み formula があれば適宜置き換えてください。
   - VS Code 拡張のみ入れたい場合は `brew bundle --file Brewfile --vscode`。
3. **Zsh 設定をホームにリンク**:
   ```bash
   ./deploy.sh
   ```
   `deploy.sh` はスクリプトが置かれたディレクトリを自動判別し、`~/.zshrc` へシンボリックリンクを作成します。
4. **Oh My Zsh / Powerlevel10k を読み込む**:
   - `~/.zshrc` で `zsh/config.zsh` を `source` することで、`$HOME/.oh-my-zsh` にインストール済みの Oh My Zsh が有効化されます。
   - Powerlevel10k の初回設定は `p10k configure` を実行。
5. **シェルを再読み込み**:
   ```bash
   exec zsh
   ```

## カスタムプラグインの追加

1. `oh-my-zsh/custom/plugins/` にプラグインを配置（Git submodule や `git subtree` で管理しても良い）。
2. `zsh/config.zsh` 内の `plugins=(...)` にプラグイン名を追記。
3. 新しいシェルを立ち上げ、`plugin-name --help` などで読み込みを確認。

`jump` や `fzf` のように外部コマンドが必要なものは `Brewfile` にも追加してください。

## Google Cloud SDK の補完

`.zshrc` で `/opt/homebrew/Caskroom/google-cloud-sdk/latest/...` を参照しています。Apple Silicon / Intel のパス差異を避ける場合は `$(brew --prefix)/Caskroom/...` でガードしてください。未インストール時には `if [ -f ... ]; then source ...; fi` を推奨します。

## 運用メモ

- **アップデート**: `brew update && brew upgrade` 後に `brew bundle dump --file Brewfile --force` で依存リストを更新。
- **変更の反映**: `zsh/` 配下を編集したら `source ~/.zshrc` で即反映。
- **トラブルシュート**: `echo $ZSH` で Oh My Zsh パスを確認し、存在しない場合は `$HOME/.oh-my-zsh` に修正。

## 参考コマンド

```bash
# Brewfile の検証
brew bundle check --file Brewfile

# VS Code 拡張のみ再インストール
brew bundle --file Brewfile --vscode --force

# dotfiles 更新を Pull
cd ~/dotfiles && git pull origin main
```

上記をベースに、必要に応じて環境固有の設定を追記してください。
