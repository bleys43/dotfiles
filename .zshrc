# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' prompt '%e errors to correct'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/home/chrisoc/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt appendhistory notify
bindkey -v
# End of lines configured by zsh-newuser-install

# vim-like keybindings adjusted for dvorak layout
bindkey -a "s" vi-forward-char
bindkey -a "h" vi-backward-char
bindkey -a "l" vi-repeat-search
bindkey -a "k" vi-find-next-char-skip
bindkey -a "t" down-line-or-history
bindkey -a "n" up-line-or-history

# personal aliases
alias ls='ls --color=auto'
alias mocp='mocp -T green_theme'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lh='ls -AFd .*'

# Variables and routines for setting the shell prompt and window title
#
autoload -U colors && colors
cr='%{$fg[red]%}'
cm='%{$fg[magenta]%}'
if [ -n "$TMUX" ] 
then
	tm_sess_or_pty='tmux:$(/usr/bin/tmux display-message -p "#S")'
else 
	tm_sess_or_pty='%l'
fi
file_count='$(/bin/ls -1FA |grep -v /$ | /usr/bin/wc -l | /bin/sed "s: ::g")'
directory_count='$(/bin/ls -1FA |grep /$ | /usr/bin/wc -l | /bin/sed "s: ::g")'
cwd_size='$(/bin/ls -lAh | /bin/grep -m 1 total | /bin/sed "s/total //")'
prompt_top="%{$fg[magenta]%}-%{$fg[red]%}-( %{$fg[magenta]%}%~ %{$fg[red]%})-%{$fg[magenta]%}-(%{$fg[red]%} $file_count files %{$fg[magenta]%}$directory_count directories %{$fg[red]%}$cwd_size %{$fg[magenta]%})-%{$fg[red]%}-"
prompt_bottom="%{$fg[magenta]%}< %{$fg[red]%}%n%{$reset_color%}@%{$fg[magenta]%}%m %{$fg[red]%}>%{$fg[magenta]%} %#%{$reset_color%} "
PS1=$prompt_top$'\n'$prompt_bottom
RPS1="$cr<$cm $tm_sess_or_pty $cr>%{$reset_color%}"
setopt promptsubst
case $TERM in
	(*xterm* | rxvt | *screen*)

		# Write some info to terminal title.
		# This is seen when the shell prompts for input.
		function precmd {
			print -Pn "\e]0;%n@%m: %~\a"
		}
		# Write command and args to terminal title.
		# This is seen while the shell waits for a command to complete.
		function preexec {
			printf "\033]0;%s\a" "$1"
		}

		;;
esac
