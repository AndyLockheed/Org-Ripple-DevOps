a2enmod proxy proxy_ajp
a2enconf ajp.conf

groupadd tomcat
useradd -s /bin/false -g tomcat -d /opt/apache-tomcat tomcat

chmod g+rwx /opt/apache-tomcat/
chmod g+r /opt/apache-tomcat/conf/

chown -R tomcat /opt/apache-tomcat
chgrp -R tomcat /opt/apache-tomcat

sudo initctl reload-configuration
cp /etc/apache2/conf-available/ajp.conf /etc/apache2/sites-available/15-default.conf

service apache2 restart
