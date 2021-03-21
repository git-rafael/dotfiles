#!/bin/zsh

export PATH="${HOME}/.local/bin:${PATH}";
function setsource { source $1 && export $(cat $1 | grep -v '\s*#' | cut -s -d= -f1); }

readonly SECRETS_FILE=${HOME}/.secrets;
if [ -s "${SECRETS_FILE}" ]; then
  setsource ${SECRETS_FILE};
fi

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
