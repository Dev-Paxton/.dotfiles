#!/usr/bin/env bash

icon_color="#[fg=black,bg=#a2dd9c]" 
text_color="#[fg=white,bg=#2e2f40]" 

machine="$icon_color 󰒋 $text_color #H "

session="$icon_color  $text_color #S "

if [ "$(git -C $1 branch --show-current)" != "" ]
then
	git="$icon_color 󰊢 $text_color $(git -C $1 branch --show-current) "
	
	if [ "$(git -C $1 status --porcelain)" = "" ]; then
		git="$git 󰗠"
	else
		git="$git  "
		changes=$(git -C $1 diff --shortstat | sed 's/^[^0-9]*\([0-9]*\)[^0-9]*\([0-9]*\)[^0-9]*\([0-9]*\)[^0-9]*/\1;\2;\3/')
		changes_array=(${changes//;/ })
		untracked=$(git -C $1 status --porcelain 2>/dev/null| grep -c "^??")
		result=()

		if [[ $untracked != 0 ]]; then
			result+=("?$untracked")
		fi

		if [[ -n ${changes_array[0]} ]]; then
    		result+=("~${changes_array[0]}")
  		fi

		joined=$(printf " %s" "${result[@]}")
  		joined=${joined:1}

  		if [[ -n $joined ]]; then
    		git="$git $joined"
  		fi
	fi
fi
 
path=$(echo $1 | sed "s!/home/$USER!~!")
working_dir="$icon_color 󰉋 $text_color $path"

echo $working_dir $git $session $machine" "
