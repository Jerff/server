yum update -y
yum install -y php-curl php-fpm stunnel catdoc xpdf munin nagios sphinx
systemctl enable php-fpm.service
mkdir /home/bitrix/tmp/
mkdir /home/bitrix/tmp/php_sessions
mkdir /home/bitrix/tmp/php_upload
mkdir /home/bitrix/log/
chown -R bitrix:bitrix /home/bitrix/

cd /usr/local/sbin
sudo wget https://dl.eff.org/certbot-auto
cd /tmp
git clone https://github.com/certbot/certbot
sudo chmod a+x /usr/local/sbin/certbot-auto
certbot-auto certonly --webroot --agree-tos --email info@site.ru -w /home/bitrix/www/ -d site.ru -d www.site.ru -d test.site.ru
openssl dhparam -out /etc/nginx/ssl/c/dhparam.pem 2048
service nginx reload

nano /etc/crontab
>>добавляем строки
30 2 * * 1 /usr/local/sbin/certbot-auto renew >> /var/log/le-renew.log
35 2 * * 1 /etc/init.d/nginx reload

mkdir /var/lib/mysql/tmp
chown mysql:mysql /var/lib/mysql/tmp
id mysql
файл fstab добавляем запись uid и gid пользователя mysql
tmpfs /var/lib/mysql/tmp tmpfs rw,gid=993,uid=995,size=1G,nr_inodes=10k,mode=0700 0 0

перезаливаем файлы из архива