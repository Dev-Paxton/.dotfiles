#!/usr/bin/env bash

end_time=$(tmux show -gv @timer_end)
if [ -z "$end_time" ]; then
    echo
    read -p " Minutes: " minutes
    tmux set -g @timer_end "$(($(date +%s) + $minutes * 60))"
    exit 0
fi

tput civis
while true; do
    end_time=$(tmux show -gv @timer_end)

    now=$(date +%s)
    remaining=$(( end_time - now ))

    minutes=$(( remaining / 60 ))
    seconds=$(( remaining % 60 ))

    height=$(tput lines)
    width=$(tput cols)
    text=$(printf '%02d:%02d' $minutes $seconds)
    text_length=$(figlet -W "$text" | head -n1 | wc -c)
    left_padding=$(( (width - text_length) / 2))
    top_padding=$(( (height / 2) - 5 ))

    clear
    for ((i=0;i<top_padding;i++)); do echo; done
        # printf "%*s%s\n" $left_padding "" "$text"
        figlet -W "$text" | while IFS= read -r line; do
            printf "%*s%s\n" $left_padding "" "$line"
        done
    sleep 1
    if [ "$remaining" -le 0 ]; then
        tmux set -g @end_time ""
        exit 0
    fi
done
exit 0

trap "clear; exit" SIGINT SIGTERM

end_time=$(tmux show -gv @timer_end)
if [ -z "$end_time" ]; then echo "Kein Timer läuft."; sleep 2; exit 0; fi

while true; do
    now=$(date +%s)
    remaining=$(( end_time - now ))

    if [ $remaining -le 0 ]; then
        clear
        printf "\n\n      ⏳ 00:00:00\n\n"
        sleep 2
        exit 0
    fi

    hours=$(( remaining / 3600 ))
    minutes=$(( (remaining % 3600) / 60 ))
    seconds=$(( remaining % 60 ))

    term_width=$(tput cols)
    term_height=$(tput lines)
    text="⏳ $(printf '%02d:%02d:%02d' $hours $minutes $seconds)"
    text_length=${#text}
    left_padding=$(( (term_width - text_length) / 2 ))
    top_padding=$(( (term_height / 2) - 1 ))

    clear
    for ((i=0;i<top_padding;i++)); do echo; done
    printf "%*s%s\n" $left_padding "" "$text"

    sleep 1
done
