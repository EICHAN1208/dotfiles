#!/bin/bash
set -eu

echo "以下を削除します:"
echo "  - ~/.zshrc シンボリックリンク"
echo "  - ~/.local/share/zinit/ (zinit本体+プラグイン)"
echo "  - ~/.cache/p10k-* (インスタントプロンプトキャッシュ)"
echo ""
read -p "続行しますか？ (y/N): " answer
if [[ "$answer" != "y" && "$answer" != "Y" ]]; then
  echo "中断しました。"
  exit 0
fi

# ~/.zshrc シンボリックリンクの削除
if [[ -L "$HOME/.zshrc" ]]; then
  rm "$HOME/.zshrc"
  echo "削除: ~/.zshrc"
elif [[ -f "$HOME/.zshrc" ]]; then
  echo "スキップ: ~/.zshrc はシンボリックリンクではありません"
fi

# zinit の削除
if [[ -d "$HOME/.local/share/zinit" ]]; then
  rm -rf "$HOME/.local/share/zinit"
  echo "削除: ~/.local/share/zinit/"
fi

# p10k キャッシュの削除
for f in "$HOME"/.cache/p10k-*; do
  if [[ -e "$f" ]]; then
    rm -f "$f"
    echo "削除: $f"
  fi
done

echo ""
echo "アンインストール完了。新しいシェルを開くとデフォルトのzsh設定で起動します。"
