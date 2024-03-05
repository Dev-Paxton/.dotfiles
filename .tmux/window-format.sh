number="#I"

if [ "$1" = "zsh" ]
then
	text="/	#{b:pane_current_path}"
else
	text="#W"
fi

echo "#[fg=black,bg=#83adf1] $number #[fg=white,bg=#2e2f40] $text "
