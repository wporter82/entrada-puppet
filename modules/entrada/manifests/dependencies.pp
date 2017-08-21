class entrada::dependencies {

  exec { "apt-get update":
    command => "/usr/bin/apt-get update"
  }

  package {
    [
      'git',
      'apache2',
      'libapache2-mod-php5',
      'php5-mysql',
      'php5-curl',
    ]:
      ensure => present,
      require => Exec['apt-get update']
  }
}
