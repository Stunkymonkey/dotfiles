#!/bin/sh

if [ -z "${IN_NIX_SHELL}" ]; then
	# shellcheck disable=SC2034  # Unused variables left for readability
	LP_ENABLE_TITLE=1
	# shellcheck disable=SC2034  # Unused variables left for readability
	LP_ENABLE_SCREEN_TITLE=1
	# shellcheck disable=SC2034  # Unused variables left for readability
	LP_ENABLE_SSH_COLORS=1
	# shellcheck disable=SC2034  # Unused variables left for readability
	LP_ENABLE_VCS_ROOT=1
	# shellcheck disable=SC2034  # Unused variables left for readability
	LP_DISABLED_VCS_PATH=""
	# shellcheck disable=SC2034  # Unused variables left for readability
	LP_ENABLE_TEMP=0
	# shellcheck disable=SC2034  # Unused variables left for readability
	LP_ENABLE_BATT=0
	# shellcheck disable=SC2034  # Unused variables left for readability
	LP_ENABLE_SUDO=1

	# Show the time for commands executing longer than 5 seconds
	# shellcheck disable=SC2034  # Unused variables left for readability
	LP_RUNTIME_THRESHOLD=5

	# shellcheck source=../bash/liquidprompt/liquidprompt
	. ~/.liquidprompt/liquidprompt
fi
