#!/bin/sh

trap "clear; echo 'Exiting...'; exit 0" INT

while true; do
    clear
    echo "$(hostname) - $(date)"
    echo
    uptime
    sleep 5

    clear
    if [ -f /etc/motd ]; then
        cat /etc/motd
    else
        echo "/etc/motd not found"
    fi
    sleep 5

    clear
    df -h
    sleep 5

    clear
    ip a
    sleep 5

    clear
    ip route
    sleep 5

    clear
    if command -v journalctl >/dev/null 2>&1; then
        journalctl -n 15 --no-pager
    elif [ -f /var/log/syslog ]; then
        tail -15 /var/log/syslog
    else
        echo "No logs found"
    fi
    sleep 5
done 
