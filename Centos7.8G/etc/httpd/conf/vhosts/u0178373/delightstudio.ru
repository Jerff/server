<VirtualHost 127.0.0.1:8080>
	ServerName delightstudio.ru
	DocumentRoot /var/www/u0178373/data/www/delightstudio.ru
	ServerAdmin webmaster@delightstudio.ru
	AddDefaultCharset off
	SuexecUserGroup u0178373 u0178373
	CustomLog /var/www/httpd-logs/delightstudio.ru.access.log combined
	ErrorLog /var/www/httpd-logs/delightstudio.ru.error.log
	<FilesMatch "\.ph(p[3-5]?|tml)$">
		SetHandler fcgid-script
		FCGIWrapper /var/www/php-bin-php56-regru/u0178373/php
	</FilesMatch>
	ScriptAlias /cgi-bin/ /var/www/u0178373/data/www/delightstudio.ru/cgi-bin/
	ServerAlias delightstudio.v2.ru www.delightstudio.ru
	DirectoryIndex index.html index.php
</VirtualHost>
<Directory /var/www/u0178373/data/www/delightstudio.ru>
	Options +Includes +ExecCGI
</Directory>