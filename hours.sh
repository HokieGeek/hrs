#!/bin/bash

file="hours"

if [ $# -gt 0 ]; then
    case $1 in
        start) echo -n "`date +%Y%m%d_%H%M%S` (`date +%s`), " >> ${file} ;;
        end) echo "`date +%Y%m%d_%H%M%S` (`date +%s`)" >> ${file} ;;
    esac
else
    awk ' \
    length() > 0 && $0 ~ /\(/ {
        gsub("[(),]", "");
        secs=$4-$2
        sub("_.*$", "", $1);
        days[$1] += secs
    }
    END {
        for (day in days) {
            secs=days[day]-68400;
            printf("%s: %s\n", day, strftime("%T", secs))·
        }
    }
    ' ${file}
fi