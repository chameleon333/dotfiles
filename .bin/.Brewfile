# zplug
if [ -f ~/.zplug/init.zsh ]; then
  source ~/.zplug/init.zsh
  zplug 'zplug/zplug', hook-build:'zplug --self-manage'
  zplug "mafredri/zsh-async"
  zplug "sindresorhus/pure"
  zplug "zsh-users/zsh-syntax-highlighting"
  zplug "zsh-users/zsh-history-substring-search"
  zplug "zsh-users/zsh-autosuggestions"
  zplug "zsh-users/zsh-completions"
  zplug "chrissicool/zsh-256color"
  zplug "mrowa44/emojify", as:command

  # Install plugins if not yet installed
  if ! zplug check --verbose; then
    printf "Install zplug plugins? [y/N]: "
    if read -q; then
      echo; zplug install
    fi
  fi

  zplug load
else
  echo "⚠️ zplug not found. You can install it with: brew install zplug"
fi