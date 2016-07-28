if $osfamily == 'windows' {
	# puppet does not respect source_permissions in Windows 
	# files would be inaccessible unless permissions we ignored
	File { source_permissions => ignore }
	
	# default package provider
	Package { 
		provider => chocolatey
	}
	
	Vcsrepo {
		provider => "git",
	}
}

node default {

	## Variables
	$development_packages = [
		"git",
		"GoogleChrome",
		"7zip.install",
		"eclipse",
		"mysql",
		"mysql.workbench",
		"visualstudiocode",
		"ruby",
	]
	
	## Packages
	package { $development_packages: 
		ensure => installed,
	}
	
	package { "jdk8":
		ensure => "8.0.92"
	}
		
	package { "nodejs": 
		ensure => "4.4.5"
	}
		
	## Package Configuration
	exec { "package-configuration" :
		command => "C:\\vagrant\\tools\\package-configuration.bat",
		require	=> [ Package["ruby"], Package["git"] ],
	}
	
	## Products
	
	## Files 
	file { 'hosts' : 
		path => "C:/windows/System32/drivers/etc/hosts",
		ensure => present,
		source => "C:/vagrant/files/hosts",
	}
	
	file { "update-configuration":
		path => "C:/update-configuration.bat",
		ensure => present,
		source => "C:/vagrant/files/update-configuration.bat"
	}
	
	file { "work-directory":
		ensure => directory,
		path => "C:/work/"
	}
	
	## Operating System
	exec { "desktop-background":
		command => "C:/vagrant/tools/set-desktop-background.bat C:\\vagrant\\files\\background.bmp",
	}
	
	exec { "show-hidden-files":
		command => "C:/vagrant/tools/show-hidden-files.bat",
	}
	
	exec { "show-known-file-extensions":
		command => "C:/vagrant/tools/show-known-file-extensions.bat",
	}
	
	windows_env { "JAVA_HOME":
      ensure    => present,
      value     => "C:\\Program Files\\Java\\jdk1.8.0_92",
      mergemode => clobber,
    }
	
	windows_env { "PATH-JAVA_HOME": 
		ensure => present,
		variable => "PATH",
		value => "C:\\Program Files\\Java\\jdk1.8.0_92\\bin",
		mergemode => append
	}
	
	windows_env { "M2_HOME":
      ensure    => present,
      value     => "C:\\tools\\apache-maven-3.3.3",
      mergemode => clobber,
    }
	
	windows_env { "PATH": 
		ensure => present,
		variable => "PATH",
		value => "C:\\tools\\apache-maven-3.3.3\\bin",
		mergemode => append
	}
	
	windows_env { "MYSQL_HOME":
      ensure    => present,
      value     => "C:\\tools\\mysql\\current",
      mergemode => clobber,
    }
	
	windows_env { "PATH-MYSQL_HOME": 
		ensure => present,
		variable => "PATH",
		value => "C:\\tools\\mysql\\current\\bin",
		mergemode => append
	}
	
	windows_env { "PATH-RUBY": 
		ensure => present,
		variable => "PATH",
		value => "C:\\tools\\ruby23\\bin",
		mergemode => append
	}
	
	## Git
	file { "ssh-directory": 
		path => "C:/Users/vagrant/.ssh/",
		ensure => directory,
	}
	
	file { "ssh-key": 
		path => "C:/Users/vagrant/.ssh/id_rsa",
		ensure => present,
		source => "C:/hostUser/.ssh/id_rsa",
		require => File["ssh-directory"],
	}
	
	file { "known-hosts": 
		path => "C:/Users/vagrant/.ssh/known_hosts",
		ensure => present,
		source => "C:/hostUser/.ssh/known_hosts",
		require => File["ssh-directory"],
	}
	
	file { "project-repo-directory":
		ensure => directory,
		path => "C:/work/ripple/",
		require => File["work-directory"]
	}
	
	$gitDependencies = [ Package["git"], File["ssh-key"], File["known-hosts"] ]
	
	vcsrepo { "C:\\work\\ripple\\org-ripple-core":
		ensure   => present,
		provider => "git",
		source   => "https://github.com/RippleOSI/Org-Ripple-Core.git",
		revision => "develop",
		require => $gitDependencies,
	}
	
	## Database
	exec { "initialise-db" :
		cwd 	=> "C:\\work\\ripple\\org-ripple-core\\ripple-database\\src\\main\\resources\\sql\\legacy",
		command => "C:\\vagrant\\tools\\initialise_database.cmd",
		require	=> [ Package["mysql"], Vcsrepo["C:\\work\\ripple\\org-ripple-core"] ],
	}
}