Exec { path  => ['/usr/bin', '/usr/sbin', '/bin'] }

package { "upstart-sysv":
	ensure => present
}

class { "jdk_oracle":
	version => "8",
	version_update => "92",
	version_build => "14",
	use_cache => false,
	
}

class { "tomcat": } 

tomcat::instance { "ripple":
  source_url => "http://archive.apache.org/dist/tomcat/tomcat-8/v8.0.36/bin/apache-tomcat-8.0.36.tar.gz"
}->
tomcat::service { "default": }

file { "/etc/init/tomcat.conf":
	source => "/mnt/host/modules/custom-files/tomcat.conf",
	require => Package["upstart-sysv"],
}

class { 'apache': }

file { "/etc/apache2/conf-available/ajp.conf":
    source => "/mnt/host/modules/custom-files/ajp.conf",
    require => Class["apache"],
}

exec { "postInstallConfig":
	command => "/mnt/host/modules/custom-files/postInstallConfig.sh",
	require => File["/etc/apache2/conf-available/ajp.conf"],
}

class { '::mysql::server': }
