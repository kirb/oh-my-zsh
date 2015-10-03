POWERLEVEL9K_MODE=awesome-patched
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time context vcs dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status battery)
POWERLEVEL9K_TIME_FORMAT='%D{%a %b %e %H:%M:%S}'
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="┌"
POWERLEVEL9K_MULTILINE_SECOND_PROMPT_PREFIX="└ "

# battery for prompt
prompt_battery() {
	percentage=$(battery_pct)
	symbol='%%'

	battery_is_charging && symbol="%{$fg[yellow]%}$ROOT_ICON"
	battery_is_fully_charged && symbol="%{$fg[yellow]%}$OK_ICON"

	if [[ "$percentage" == "" ]]; then
		return
	elif (( $percentage >= 50 )); then
		color=green
	elif (( $percentage >= 20 )); then
		color=yellow
	else
		color=red
	fi

	$1_prompt_segment "$0" "$color" "$DEFAULT_COLOR" "$percentage$symbol"
}

source $ZSH/themes/powerlevel9k/powerlevel9k.zsh-theme
