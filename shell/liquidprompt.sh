#!/bin/sh

if [ -z "${IN_NIX_SHELL}" ]; then
	LP_ENABLE_TITLE=1
	LP_ENABLE_SSH_COLORS=1
	LP_ENABLE_VCS_ROOT=1
	LP_DISABLED_VCS_PATH=""
	LP_ENABLE_TEMP=0
	LP_ENABLE_BATT=0
	LP_ENABLE_SUDO=1

	# Show the time for commands executing longer than 5 seconds
	LP_RUNTIME_THRESHOLD=5

	source ~/.liquidprompt/liquidprompt
fi
