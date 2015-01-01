PROMPT='%{$fg[red]%}%D{%a %b %e %H:%M:%S} %{$fg[green]%}%n@%m$(git_prompt_info)
%{$fg[yellow]%}%d$ %{$reset_color%}'
RPROMPT='$(_kirb_battery)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" (dirty)%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=

_kirb_battery() {
	percentage=$(ioreg -n AppleSmartBattery -r | awk '$1 ~/Capacity/ { values[$1] = $3 } END { OFMT="%.2f%%"; max = values["\"MaxCapacity\""]; printf("%d", max > 0 ? 100 * values["\"CurrentCapacity\""] / max: -1) }')

	charging='+'

	if [[ "$(ioreg -n AppleSmartBattery -r | \grep -c '^.*"ExternalConnected"\ =\ No' -)" == "1" ]]; then
		charging='%%'
	fi

	if [[ $percentage == -1 ]]; then
		return
	elif [[ $percentage < 20 ]]; then
		echo -n "%{$fg[red]%}"
	else
		echo -n "%{$fg[green]%}"
	fi

	echo "${percentage}${charging}"
}
