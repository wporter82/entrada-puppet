class entrada::code($destination) {

  $folder = dirname($destination)

  file { "${folder}": ensure => directory }

  vcsrepo { $destination:
    ensure => present,
    provider => git,
    source => 'https://github.com/EntradaProject/entrada-1x.git',
    owner => 'vagrant',
    group => 'vagrant',
    require => File[$folder],
  }

  exec { 'set permissions':
    command => "chmod -R 777 ${destination}/www-root/core",
    path => '/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/opt/puppetlabs/bin',
    require => Vcsrepo[$destination],
  }

  exec { 'install composer':
    command => 'curl -sS https://getcomposer.org/installer | php;
                php composer.phar update',
    cwd => $destination,
    path => '/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/opt/puppetlabs/bin',
    environment => ['HOME=/home/vagrant'],
    user => 'vagrant',
    timeout => '0',
    require => Vcsrepo[$destination],
  }
}
