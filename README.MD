![](https://raw.githubusercontent.com/bembenk18/trustpositif/main/pict.jpg)
# named.conf
        options {
        response-policy {
                zone "trustpositif";
                };
        }
        zone "trustpositif" IN {
                type master;
                file "/var/named/trustpositif/trustpositif.zone"; 
                allow-query {any;};
                allow-update {none;};
        };



### Buat cronjob untuk jalankan file update-db.sh
### Ganti url database
### Tambahkan token dan chat id telegram untuk notifikasi update
### Ganti IP



