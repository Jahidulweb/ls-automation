#!/bin/bash

FILE="lines.txt"

# ফাইল আছে কিনা চেক
if [ ! -f "$FILE" ]; then
    echo -e "\e[31mError: $FILE পাওয়া যায়নি\e[0m"
    exit 1
fi

# random লাইন প্রিন্ট করো
LINE=$(shuf -n 1 "$FILE")

# Run First "clear" Command.
clear
echo -e ""
echo -e "WellCome, Jahidul Islam Shuvo"
echo -e ""
echo -e "✨ See Your Calender:"
echo -e ""
cal
echo -e ""
echo -e "$LINE"
echo -e ""
echo -e "#++++++++++++++++++++++++++++"