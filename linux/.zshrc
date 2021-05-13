#$B;29M(B https://qiita.com/ryuichi1208/items/2eef96debebb15f5b402

# -----------------------------
# Lang
# -----------------------------
#export LANG=ja_JP.UTF-8
#export LESSCHARSET=utf-8

# -----------------------------
# General
# -----------------------------
# $B?'$r;HMQ(B
autoload -Uz colors ; colors

# $B%(%G%#%?$r(Bvim$B$K@_Dj(B
export EDITOR=vim

# Ctrl+D$B$G%m%0%"%&%H$7$F$7$^$&$3$H$rKI$0(B
#setopt IGNOREEOF

# $B%Q%9$rDI2C$7$?$$>l9g(B
export PATH="$HOME/bin:$PATH"

# cd$B$7$?:]$N%G%#%l%/%H%j$r%G%#%l%/%H%j%9%?%C%/$X<+F0DI2C(B
setopt auto_pushd

# Ctrl+D$B$G(Bzsh$B$r=*N;$7$J$$(B
#setopt ignore_eof

# $B%G%#%l%/%H%j%9%?%C%/$X$NDI2C$N:]$K=EJ#$5$;$J$$(B
setopt pushd_ignore_dups

# emacs$B%-!<%P%$%s%I(B
bindkey -e

# vi$B%-!<%P%$%s%I(B
#bindkey -v

# $B%U%m!<%3%s%H%m!<%k$rL58z$K$9$k(B
setopt no_flow_control

# $B%o%$%k%I%+!<%IE83+$r;HMQ$9$k(B
setopt extended_glob

# cd$B%3%^%s%I$r>JN,$7$F!"%G%#%l%/%H%jL>$N$_$NF~NO$G0\F0(B
setopt auto_cd

# $B%3%^%s%I%i%$%s$,$I$N$h$&$KE83+$5$l<B9T$5$l$?$+$rI=<($k$h$&$K$J$k(B
#setopt xtrace

# $B<+F0$G(Bpushd$B$r<B9T(B
setopt auto_pushd

# pushd$B$+$i=EJ#$r:o=|(B
setopt pushd_ignore_dups

# $B%S!<%W2;$rLD$i$5$J$$$h$&$K$9$k(B
#setopt no_beep

# $B%+%C%3$NBP1~$J$I$r<+F0E*$KJd40$9$k(B
setopt auto_param_keys

# $B%G%#%l%/%H%jL>$NF~NO$N$_$G0\F0$9$k(B
setopt auto_cd

# bg$B%W%m%;%9$N>uBVJQ2=$rB(;~$KCN$i$;$k(B
setopt notify

# 8bit$BJ8;z$rM-8z$K$9$k(B
setopt print_eight_bit

# $B=*N;%9%F!<%?%9$,(B0$B0J30$N>l9g$K%9%F!<%?%9$rI=<($9$k(B
setopt print_exit_value

# $B%U%!%$%kL>$NE83+$G%G%#%l%/%H%j$K%^%C%A$7$?>l9g(B $BKvHx$K(B / $B$rIU2C(B
setopt mark_dirs

# $B%3%^%s%I$N%9%Z%k%A%'%C%/$r$9$k(B
setopt correct

# $B%3%^%s%I%i%$%sA4$F$N%9%Z%k%A%'%C%/$r$9$k(B
setopt correct_all

# $B>e=q$-%j%@%$%l%/%H$N6X;_(B
setopt no_clobber

# sudo $B$N8e$m$G%3%^%s%IL>$rJd40$9$k(B
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps $B%3%^%s%I$N%W%m%;%9L>Jd40(B
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# $B%Q%9$N:G8e$N%9%i%C%7%e$r:o=|$7$J$$(B
setopt noautoremoveslash

# $B3F%3%^%s%I$,<B9T$5$l$k$H$-$K%Q%9$r%O%C%7%e$KF~$l$k(B
#setopt hash_cmds

# rsysnc$B$G(Bssh$B$r;HMQ$9$k(B
export RSYNC_RSH=ssh

# $B$=$NB>(B
umask 022
ulimit -c 0

# -----------------------------
# Prompt
# -----------------------------
# %M    $B%[%9%HL>(B
# %m    $B%[%9%HL>(B
# %d    $B%+%l%s%H%G%#%l%/%H%j(B($B%U%k%Q%9(B)
# %~    $B%+%l%s%H%G%#%l%/%H%j(B($B%U%k%Q%9(B2)
# %C    $B%+%l%s%H%G%#%l%/%H%j(B($BAjBP%Q%9(B)
# %c    $B%+%l%s%H%G%#%l%/%H%j(B($BAjBP%Q%9(B)
# %n    $B%f!<%6L>(B
# %#    $B%f!<%6<oJL(B
# %?    $BD>A0$N%3%^%s%I$NLa$jCM(B
# %D    $BF|IU(B(yy-mm-dd)
# %W    $BF|IU(B(yy/mm/dd)
# %w    $BF|IU(B(day dd)
# %*    $B;~4V(B(hh:flag_mm:ss)
# %T    $B;~4V(B(hh:mm)
# %t    $B;~4V(B(hh:mm(am/pm))
PROMPT='%F{cyan}%n%f %F{yellow}%~%f $ '

# -----------------------------
# Completion
# -----------------------------
# $B<+F0Jd40$rM-8z$K$9$k(B
autoload -Uz compinit ; compinit

# $BC18l$NF~NOESCf$G$b(BTab$BJd40$rM-8z2=(B
#setopt complete_in_word

# $B%3%^%s%I%_%9$r=$@5(B
setopt correct

# $BJd40$NA*Br$r3Z$K$9$k(B
zstyle ':completion:*' menu select

# $BJd408uJd$r$G$-$k$@$15M$a$FI=<($9$k(B
setopt list_packed

# $BJd408uJd$K%U%!%$%k$N<oN`$bI=<($9$k(B
#setopt list_types

# $B?'$N@_Dj(B
export LSCOLORS=Exfxcxdxbxegedabagacad

# $BJd40;~$N?'@_Dj(B
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# $B%-%c%C%7%e$NMxMQ$K$h$kJd40$N9bB.2=(B
zstyle ':completion::complete:*' use-cache true

# $BJd408uJd$K?'$D$1$k(B
autoload -U colors ; colors ; zstyle ':completion:*' list-colors "${LS_COLORS}"
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# $BBgJ8;z!&>.J8;z$r6hJL$7$J$$(B($BBgJ8;z$rF~NO$7$?>l$O6hJL$9$k(B)
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# man$B$NJd40$r%;%/%7%g%sHV9fJL$KI=<($5$;$k(B
zstyle ':completion:*:manuals' separate-sections true

# --prefix=/usr $B$J$I$N(B = $B0J9_$G$bJd40(B
setopt magic_equal_subst

# -----------------------------
# History
# -----------------------------
# $B4pK\@_Dj(B
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

# $B%R%9%H%j!<$K=EJ#$rI=<($7$J$$(B
setopt histignorealldups

# $BB>$N%?!<%_%J%k$H%R%9%H%j!<$r6&M-(B
setopt share_history

# $B$9$G$K(Bhistory$B$K$"$k%3%^%s%I$O;D$5$J$$(B
setopt hist_ignore_all_dups

# history$B$KF|IU$rI=<((B
alias h='fc -lt '%F %T' 1'

# $B%R%9%H%j$KJ]B8$9$k$H$-$KM>J,$J%9%Z!<%9$r:o=|$9$k(B
setopt hist_reduce_blanks

# $BMzNr$r$9$0$KDI2C$9$k(B
setopt inc_append_history

# $B%R%9%H%j$r8F$S=P$7$F$+$i<B9T$9$k4V$K0lC6JT=8$G$-$k>uBV$K$J$k(B
setopt hist_verify

#$BM>J,$J%9%Z!<%9$r:o=|$7$F%R%9%H%j$KO?$9$k(B
#setopt hist_reduce_blanks

# history$B%3%^%s%I$O;D$5$J$$(B
#setopt hist_save_no_dups

# ^R $B$GMzNr8!:w$r$9$k$H$-$K(B * $B$G%o%$%k%I%+!<%I$r;HMQ=PMh$k$h$&$K$9$k(B
#bindkey '^R' history-incremental-pattern-search-backward
#bindkey "^S" history-incremental-search-forward

# ^P,^N$B$r8!:w$X3d$jEv$F(B
#bindkey "^P" history-beginning-search-backward-end
#bindkey "^N" history-beginning-search-forward-end

# -----------------------------
# Alias
# -----------------------------
# $B%0%m!<%P%k%(%$%j%"%9(B
alias -g L='| less'
alias -g H='| head'
alias -g G='| grep'
alias -g GI='| grep -ri'

# $B%(%$%j%"%9(B
########################################
# OS $BJL$N@_Dj(B
case ${OSTYPE} in
    darwin*)
        #Mac$BMQ$N@_Dj(B
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux$BMQ$N@_Dj(B
        alias ls='ls -F --color=auto'
        ;;
esac

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'
alias uuuu='cd ../../../..'
alias uuuuu='cd ../../../../..'
alias rm='rm -iv'
alias cp='cp -iv'
alias mv='mv -iv'
alias tm='tmux'
alias tma='tmux a'
alias tmls='tmux ls'

#alias lst='ls -ltr --color=auto'
#alias ls='ls --color=auto'
#alias la='ls -la --color=auto'
#alias ll='ls -l --color=auto'

alias du="du -Th"
alias df="df -Th"
alias su="su -l"
alias so='source'
alias vi='vim'
alias vz='vim ~/.zshrc'
#alias cp='cp -i'
#alias rm='rm -i'
alias mkdir='mkdir -p'
alias b='pushd'
alias diff='diff -U1'

alias dki="docker run -i -t -P"
alias dex="docker exec -i -t"
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'

# -----------------------------
# Plugin
# -----------------------------
# root $B$N%3%^%s%I$O%R%9%H%j$KDI2C$7$J$$(B
#if [ $UID = 0 ]; then
#  unset HISTFILE
#  SAVEHIST=0
#fi

#function h {
#  history
#}

#function g() {
#  egrep -r "$1" .
#}

function t()
{
  tmux new-session -s $(pwd |sed -E 's!^.+/([^/]+/[^/]+)$!\1!g' | sed -e 's/\./-/g')
}

function psgrep() {
  ps aux | grep -v grep | grep "USER.*COMMAND"
  ps aux | grep -v grep | grep $1
}

function dstop()
{
  docker stop $(docker ps -a -q);
}

function drm()
{
  docker rm $(docker ps -a -q);
}

# -----------------------------
# Plugin
# -----------------------------
# zplug$B$,L5$1$l$P%$%s%9%H!<%k(B
if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug ~/.zplug
fi

# zplug$B$rM-8z2=$9$k(B
source ~/.zplug/init.zsh

# $B%W%i%0%$%s(BList
# zplug "$B%f!<%6!<L>(B/$B%j%]%8%H%jL>(B", $B%?%0(B
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "b4b4r07/enhancd", use:init.sh
#zplug "junegunn/fzf-bin", as:command, from:gh-r, file:fzf

# $B%$%s%9%H!<%k$7$F$$$J$$%W%i%0%$%s$r%$%s%9%H!<%k(B
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
      echo; zplug install
  fi
fi

# $B%3%^%s%I$r%j%s%/$7$F!"(BPATH $B$KDI2C$7!"%W%i%0%$%s$OFI$_9~$`(B
zplug load --verbose

# -----------------------------
# PATH
# -----------------------------
case "${OSTYPE}" in
  darwin*)
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
    export MANPATH=/opt/local/share/man:/opt/local/man:$MANPATH
  ;;
esac

# -----------------------------
# Python
# -----------------------------
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#

# vi$B%-!<%P%$%s%IIwL#(B
set -o vi
clear
