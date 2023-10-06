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
1. Rename *.sh-example jadi *.sh
2. Ganti url database
3. Tambahkan token dan chat id telegram untuk notifikasi update
4. Ganti IP
#### Crontab
```bash
0 10 * * * /bin/bash /var/named/trustpositif/script/update-db.sh
```