# .dotfiles/Makefile

SHELL := /bin/zsh

# ==== エントリーポイント ====

.PHONY: all
all: zsh zplug macos ## 一括セットアップ

# ==== ZSH ====

.PHONY: zsh
zsh: ## ~/.zshrc をリンク
	@echo "🔗 Linking zshrc..."
	ln -sf $(PWD)/zsh/zshrc ~/.zshrc

.PHONY: zplug
zplug: ## zplug をインストール（必要時のみ）
	@if [ -f "$$HOME/.zplug/init.zsh" ] || [ -f "/opt/homebrew/opt/zplug/init.zsh" ]; then \
		echo "✅ zplug already installed."; \
	else \
		echo "📦 Installing zplug..."; \
		curl -sL https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh; \
	fi

# ==== macOS 設定 ====

.PHONY: macos
macos: ## macOS の設定適用
	@if [ "$$(uname)" = "Darwin" ]; then \
		echo "🍎 Applying macOS defaults..."; \
		zsh $(PWD)/macos/defaults.zsh; \
	else \
		echo "❌ Not macOS. Skipping macOS settings."; \
	fi

# ==== Homebrew ====

.PHONY: brew
brew: ## Brewfile を使ってパッケージをインストール
	@if [ -f Brewfile ]; then \
		echo "🍺 Installing from Brewfile..."; \
		brew bundle; \
	else \
		echo "❌ Brewfile not found."; \
	fi

# ==== クリーンアップ ====

.PHONY: clean
clean: ## シンボリックリンクを削除
	rm -f ~/.zshrc