#!/bin/bash
url="https://trustpositif.kominfo.go.id/"
chat_id="TELEGRAM ID"
bot_token="TOKEN BOT"
if [ ! -e /var/named/trustpositif/trustpositif.db ]; then
    touch /var/named/trustpositif/trustpositif.db
fi
existing_file_lines=$(wc -l < /var/named/trustpositif/trustpositif.db)
wget -O /var/named/trustpositif/script/trustpositif.db "$url"
wait
new_file_lines=$(wc -l < /var/named/trustpositif/script/trustpositif.db)
current_time=$(date +"%Y-%m-%d %H:%M:%S")
if [ "$new_file_lines" -eq "$existing_file_lines" ]; then
    message="$current_time\nData sama\nJumlah Baris Sebelum: $existing_file_lines\nJumlah Baris Setelah: $new_file_lines\n"
else 
    cp /var/named/trustpositif/script/trustpositif.db /var/named/trustpositif/trustpositif.db.old
    cp -f /var/named/trustpositif/script/trustpositif.db /var/named/trustpositif/trustpositif.db
    bash /var/named/trustpositif/script/make-zone.sh 
    wait
    mv /var/named/trustpositif/script/trustpositif.zone /var/named/trustpositif/trustpositif.zone
    message="$current_time\nUpdate\nJumlah Baris Sebelum: $existing_file_lines\nJumlah Baris Setelah: $new_file_lines\n"
   echo "Restarting named because data changed..."
    if sudo systemctl status named; then
        named_status=$(systemctl restart named | grep "Active:")
        named_status_message="Named Restarted Successfully:%0A$named_status"
    else
        echo "named restart failed."
        named_status_message="Named Restart Failed"
    fi
fi
message=$(echo -e "$message" "$named_status_message")
curl -d "chat_id=$chat_id&text=$message" "https://api.telegram.org/bot$bot_token/sendMessage"