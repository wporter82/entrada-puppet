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

  file { "${destination}/www-root/core":
    ensure => 'directory',
    mode => '777',
    recurse => true,
    show_diff => false,
    require => Vcsrepo[$destination],
  }

  exec { 'install composer':
    command => 'curl -sS https://getcomposer.org/installer | php',
    cwd => $destination,
    creates => "${destination}/composer.phar",
    path => '/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/opt/puppetlabs/bin',
    environment => ['HOME=/home/vagrant'],
    user => 'vagrant',
    timeout => '0',
    require => Vcsrepo[$destination],
  }

  exec { 'install dependancies':
    command => 'php composer.phar update',
    cwd => $destination,
    path => '/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/opt/puppetlabs/bin',
    environment => ['HOME=/home/vagrant'],
    user => 'vagrant',
    timeout => '0',
    require => Exec['install composer'],
  }
}
