# ~/.dotfiles/zsh/zplug.zsh

# zplugの初期化
if [ -f ~/.zplug/init.zsh ]; then
  export ZPLUG_HOME="$HOME/.zplug"
  source ~/.zplug/init.zsh
elif [ -f /opt/homebrew/opt/zplug/init.zsh ]; then
  export ZPLUG_HOME="/opt/homebrew/opt/zplug"
  source /opt/homebrew/opt/zplug/init.zsh
else
  echo "⚠️ zplug not found. You can install it with: brew install zplug"
fi

# プラグインは依存関係順に書く
zplug "mafredri/zsh-async"

# 高速プロンプト
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
# 補完機能を強化
zplug "zsh-users/zsh-completions"
zplug "chrissicool/zsh-256color"
zplug "mrowa44/emojify", as:command

# Homebrew関連
zplug "Homebrew/brew", use:"completions/zsh/_brew"

# Docker関連
zplug "docker/cli", use:"contrib/completion/zsh/_docker"
zplug "docker/compose", use:"contrib/completion/zsh/_docker-compose"

# プラグインをロード
zplug load