function _update_ps1() {
	PS1="$($HOME/.local/bin/powerline-go \
		-shell bash \
		-modules 'docker-context,venv,host,ssh,cwd,perms,git,hg,jobs,exit,root' \
		-cwd-max-depth 3 \
		-theme solarized-light16 \
		-newline \
		-hostname-only-if-ssh \
		-colorize-hostname \
		-error $? \
		-jobs $(jobs -p | wc -l))"
}

if [ "$TERM" != "linux" ] && [ -f "$HOME/.local/bin/powerline-go" ]; then
	PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi
