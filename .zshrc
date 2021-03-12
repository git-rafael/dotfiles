#!/bin/zsh
export PATH="${PATH}:${HOME}/.local/bin";
source "/usr/share/zsh/share/zgen.zsh";
if ! zgen saved; then
  zgen oh-my-zsh;

  zgen load zsh-users/zsh-completions;
  zgen load zsh-users/zsh-autosuggestions;
  zgen load zsh-users/zsh-syntax-highlighting;

  zgen oh-my-zsh plugins/wd;
  zgen oh-my-zsh plugins/git-auto-fetch;

  zgen load frosit/zsh-plugin-homeassistant-cli;

  zgen load romkatv/powerlevel10k powerlevel10k;

  zgen save;
fi
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh;
