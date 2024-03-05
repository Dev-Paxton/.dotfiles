number="#I"

if [ "$1" = "zsh" ] || [ "$1" = "bash" ]
then
	text="/	#{b:pane_current_path}"
else
	text="#W"
fi

echo "#[fg=black,bg=#feae86] $number #[fg=white,bg=#2e2f40] $text "
