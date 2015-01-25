PROMPT='%{$fg[red]%}%D{%a %b %e %H:%M:%S} %{$fg[green]%}%n@%m$(git_prompt_info)
%{$fg[yellow]%}%d$ %{$reset_color%}'
RPROMPT='$(_kirb_battery)'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" (dirty)%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

_kirb_battery() {
	percentage=100
	charging='%%'

	if $(battery_is_charging); then
		charging="%{$fg[yellow]%}⚡%{$reset_color%}"
	fi

	if [ $percentage -gt 50 ]; then
		color=green
	elif [ $percentage -gt 20 ]; then
		color=yellow
	else
		color=red
	fi
	
	echo "%{$fg[$color]%}${percentage}${charging}%{$reset_color%}"
}
