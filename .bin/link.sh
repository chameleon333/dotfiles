#!/bin/zsh

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

for dotfile in "${SCRIPT_DIR}"/.??* ; do
    [[ "$dotfile" == "${SCRIPT_DIR}/.git" ]] && continue
    [[ "$dotfile" == "${SCRIPT_DIR}/.github" ]] && continue
    [[ "$dotfile" == "${SCRIPT_DIR}/.DS_Store" ]] && continue

    ln -fnsv "$dotfile" "$HOME"
    echo "hello $dotfile"
done

# source ~/.zprofile だと失敗することがあるので、安全に呼ぶ or 明示メッセージ
echo "✅ Dotfiles linked. Please run: source ~/.zprofile"