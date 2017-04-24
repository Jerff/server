<VirtualHost 127.0.0.1:8080>
	ServerName time-d.ru
	DocumentRoot /var/www/u0178373/data/www/time-d.ru
	ServerAdmin webmaster@time-d.ru
	AddDefaultCharset off
	SuexecUserGroup u0178373 u0178373
	CustomLog /var/www/httpd-logs/time-d.ru.access.log combined
	ErrorLog /var/www/httpd-logs/time-d.ru.error.log
	<FilesMatch "\.ph(p[3-5]?|tml)$">
		SetHandler fcgid-script
		FCGIWrapper /var/www/php-bin-isp-php56/u0178373/php
	</FilesMatch>
	ScriptAlias /cgi-bin/ /var/www/u0178373/data/www/time-d.ru/cgi-bin/
	ServerAlias v2.time-d.ru www.time-d.ru
	DirectoryIndex index.html index.php
</VirtualHost>
<Directory /var/www/u0178373/data/www/time-d.ru>
	Options +Includes +ExecCGI
</Directory>
