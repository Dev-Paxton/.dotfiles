#!/usr/bin/env bash

icon_color="#[fg=black,bg=#a2dd9c]"
text_color="#[fg=white,bg=#2e2f40]"

end_time=$(tmux show -gv @timer_end)

if [ -z "$end_time" ]; then
    exit 0
fi

now=$(date +%s)
remaining=$(( end_time - now ))

if [ "$remaining" -le 0 ]; then
    text_color="#[fg=red,bg=#2e2f40]"
    remaining=$(( remaining * -1))
fi

minutes=$(( remaining / 60 ))
seconds=$(( remaining % 60 ))

printf "$icon_color 󰔟 $text_color %02d:%02d " "$minutes" "$seconds"