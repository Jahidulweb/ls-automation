#!/bin/bash

# .bashrc ফাইলে আগে থেকেই এই কোডটি আছে কিনা তা চেক করা
if grep -q "builtin cd \"\$@\" && ls" ~/.bashrc; then
    echo "⚠️ সেটিংসটি আপনার ~/.bashrc ফাইলে আগেই যোগ করা আছে!"
else
    # .bashrc ফাইলের শেষে ফাংশনটি যোগ করা
    echo -e "\n# Auto ls on cd\ncd() {\n    builtin cd \"\$@\" && ls\n}" >> ~/.bashrc
    
    # বর্তমান সেশনেই পরিবর্তনটি চালু করে দেওয়া
    eval "$(cat ~/.bashrc | grep -A 3 '# Auto ls on cd')"
    
    echo "✅ অভিনন্দন! অটো ls সেটআপ সফলভাবে সম্পন্ন হয়েছে।"
    echo "💡 এখন থেকে cd কমান্ড ব্যবহার করলেই অটোমেটিক ফাইল লিস্ট দেখাবে।"
fi
