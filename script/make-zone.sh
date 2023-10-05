#!/bin/bash
file="/var/named/trustpositif/script/trustpositif.db"
ip="103.105.**.**"
output="/var/named/trustpositif/script/trustpositif.zone"
cat /var/named/trustpositif/script/head.txt > "$output"
grep -vE '\-+' "$file" | while IFS= read -r domain; do
  if [ -n "$domain" ] && [[ "$domain" =~ ^[a-zA-Z0-9.-]+$ ]]; then
    echo "$domain  IN A $ip" >> "$output"
  fi
done
echo "File $output telah dibuat."
