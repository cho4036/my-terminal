#!/bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"
case "$(uname -s)" in
	Darwin*)
		OS=Mac
		command -v brew &> /dev/null || {
			/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" &&
			echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.profile &&
			eval "$(/opt/homebrew/bin/brew shellenv)"
		}
		command -v git &> /dev/null || brew install git
		command -v curl &> /dev/null || brew install curl
		command -v gsed &> /dev/null || brew install gnu-sed
		command -v tmux &> /dev/null || brew install tmux
		INSTALLER=$(command -v brew)
		SED=$(command -v gsed)
		BASHRC=${HOME}/.bash_profile
		test -f ${BASHRC} || touch ${BASHRC}
		;;
	*)
		ECHO "UNKNOWN OS `uname -s`"
		exit 1
		;;
esac

