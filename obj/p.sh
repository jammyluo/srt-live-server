ps auxf  | grep "./sls" | grep -v grep | awk '{printf "%s\n", $0;}'

exit 0
