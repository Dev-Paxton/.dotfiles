uptime_seconds=$(cat /proc/uptime | cut -d. -f1)
uptime_days=$(( uptime_seconds / 86400 ))

if (( uptime_days >= 5 )); then
  echo "{\"text\": \"󱫌 ${uptime_days}d\", \"alt\": \"toolong\"}"
else
  echo "{\"text\": \"\", \"alt\": \"\"}"
fi
