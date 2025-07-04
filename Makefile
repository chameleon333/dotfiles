# .dotfiles/Makefile

SHELL := /bin/zsh

# ==== エントリーポイント ====

.PHONY: all
all: zsh zplug macos brew docker ## 一括セットアップ

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
brew: ## Homebrew をインストール（必要時のみ）
	@if [ "$$(uname)" = "Darwin" ]; then \
		if command -v brew >/dev/null 2>&1; then \
			echo "✅ Homebrew already installed."; \
		else \
			echo "🍺 Installing Homebrew..."; \
			/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
			echo "📝 Adding Homebrew to PATH..."; \
			echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc; \
		fi; \
	else \
		echo "❌ Not macOS. Skipping Homebrew installation."; \
	fi

# ==== Docker ====

.PHONY: docker
docker: ## Docker と Docker Compose をインストール（必要時のみ）
	@if [ "$$(uname)" = "Darwin" ]; then \
		if command -v docker >/dev/null 2>&1; then \
			echo "✅ Docker already installed."; \
		else \
			echo "🐳 Installing Docker..."; \
			brew install docker; \
		fi; \
		if command -v docker-compose >/dev/null 2>&1; then \
			echo "✅ Docker Compose already installed."; \
		else \
			echo "🐳 Installing Docker Compose..."; \
			brew install docker-compose; \
		fi; \
	else \
		echo "❌ Not macOS. Skipping Docker installation."; \
	fi

# ==== Brewfile ====

.PHONY: brewfile
brewfile: ## Brewfile を使ってパッケージをインストール
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