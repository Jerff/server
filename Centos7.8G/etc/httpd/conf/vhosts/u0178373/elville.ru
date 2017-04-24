<VirtualHost 127.0.0.1:8080>
	ServerName elville.ru
	DocumentRoot /var/www/u0178373/data/www/elville.ru
	ServerAdmin webmaster@elville.ru
	AddDefaultCharset off
	SuexecUserGroup u0178373 u0178373
	CustomLog /var/www/httpd-logs/elville.ru.access.log combined
	ErrorLog /var/www/httpd-logs/elville.ru.error.log
	php_admin_value error_log "/var/www/httpd-logs/elville.ru.php.error.log"
	php_value error_log "/var/www/httpd-logs/elville.ru.php.error.log"
	ScriptAlias /cgi-bin/ /var/www/u0178373/data/www/elville.ru/cgi-bin/
	<FilesMatch "\.ph(p[3-5]?|tml)$">
		SetHandler fcgid-script
#		FCGIWrapper /var/www/php-bin-php70-regru/u0178373/php
		FCGIWrapper /var/www/php-bin-isp-php70/u0178373/php
	</FilesMatch>
	ServerAlias www.elville.ru
	DirectoryIndex index.html index.php
</VirtualHost>
<Directory /var/www/u0178373/data/www/elville.ru>
	Options +Includes +ExecCGI
</Directory>
