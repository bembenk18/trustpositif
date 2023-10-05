# Trust+

Auto update database & create zone


![alt text](https://raw.githubusercontent.com/bembenk18/trustpositif/main/pict.jpg)

## named.conf
```bash
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
```

## Usage
#### Setup
1. Ganti url database
2. Tambahkan token dan chat id telegram untuk notifikasi update
3. Ganti IP
#### Crontab
```bash
0 10 * * * /bin/bash /var/named/trustpositif/script/update-db.sh
```