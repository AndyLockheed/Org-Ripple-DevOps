call rmdir /s /q modules
call puppet module install --modulepath modules puppetlabs-apache
call puppet module install --modulepath modules puppetlabs-mysql
call puppet module install --modulepath modules puppetlabs-tomcat --ignore-dependencies
call puppet module install --modulepath modules tylerwalts-jdk_oracle
call xcopy custom-files "modules/custom-files" /E /Y