class entrada::webserver($environment, $destination) {
  file { 'vhost-config':
    path => '/etc/apache2/sites-available/entrada.conf',
    ensure => file,
    content => template("entrada/entrada_vhost.conf.erb"),
    require => Package['apache2'],
  }

  file { 'enable error reporting':
    path => '/etc/php5/apache2/conf.d/20-dev.ini',
    ensure => file,
    content => template("entrada/20-dev.ini.erb"),
    require => Package['apache2'],
  }

  file { $destination:
    ensure => 'directory',
    owner => 'vagrant',
    group => 'vagrant',
    mode => '755',
  }

  exec { 'enable rewrite':
    command => "/usr/sbin/a2enmod rewrite",
    creates => "/etc/apache2/mods-enabled/rewrite.load",
    require => [Package['apache2']]
  }

  exec { 'enable-site':
    command => '/usr/sbin/a2ensite entrada',
    creates => '/etc/apache2/sites-enabled/entrada.conf',
    require => File['vhost-config']
  }

  service { 'apache2':
    ensure => running,
    enable => true,
    require => Exec['enable-site']
  }

  file { 'default-vhost':
    path => '/etc/apache2/sites-enabled/000-default.conf',
    ensure => absent,
    notify => Service['apache2']
  }
}
