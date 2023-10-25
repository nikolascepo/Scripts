#Created by @nikolascepo
#services for server


wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'

sudo apt-get update
 
sudo apt-get install apache2 -y

sudo apt-get install php7.4-fpm -y

sudo apt-get install php-apcu php-bcmath php-bz2 php-curl php-gd php-igbinary php-imap php-intl php-json php-mbstring pgsql php-readline php-memcached php-msgpack php-soap php-tokenizer php-xml php-zip -y

#sudo apt-get install postfix -y

sudo apt-get install libapache2-mod-evasive -y  

sudo apt-get install libapache2-mod-security -y 

sudo apt-get install npm -y 

sudo npm install pm2 -g

sudo apt-get install composer -y

sudo apt-get install fail2ban -y

sudo apt-get install wget ca-certificates

sudo apt-get install postgresql-9.3 -y

sudo apt-get install pgbouncer -y

sudo apt-get install etcd -y

sudo apt-get install python3-pip python3-dev libpq-dev -y

pip3 install --upgrade pip
pip install patroni
pip install python-etcd
pip install psycopg2


#sudo wget https://sourceforge.net/projects/jasperserver/files/JasperServer/JasperReports%20Server%20Community%20Edition%207.8.0/TIB_js-jrs-cp_7.8.0_linux_x86_64.run


cd /etc/modsecurity/

sudo wget https://github.com/coreruleset/coreruleset/archive/refs/tags/v3.3.2.tar.gz

sudo mkdir OWASP-2022

sudo tar -zxvf v3.3.2.tar.gz -C OWASP-2022/
sudo cp crs-setup.conf.example crs-setup.conf

sudo cd rules/
sudo cp REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf.example REQUEST-900-EXCLUSION-RULES-BEFORE-CRS.conf
sudo cp RESPONSE-999-EXCLUSION-RULES-AFTER-CRS.conf.example RESPONSE-999-EXCLUSION-RULES-AFTER-CRS.conf 



#sudo nano /etc/apache2/mods-available/security2.conf 

#        IncludeOptional /etc/modsecurity/OWASP-2022/coreruleset-3.3.2/crs-setup.conf
#        IncludeOptional /etc/modsecurity/OWASP-2022/coreruleset-3.3.2/rules/*.conf


-----------------------