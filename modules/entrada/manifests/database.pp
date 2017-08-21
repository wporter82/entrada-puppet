class entrada::database {
  class { '::mysql::server':
    root_password => 'pass123',
    remove_default_accounts => true,
  }

  mysql::db { 'entrada':
    user => 'entrada',
    password => 'pass123',
    host => 'localhost',
    grant => ['ALL'],
  }
  
  mysql::db { 'entrada_auth':
    user => 'entrada',
    password => 'pass123',
    host => 'localhost',
    grant => ['ALL'],
  }

  mysql::db { 'entrada_clerkship':
    user => 'entrada',
    password => 'pass123',
    host => 'localhost',
    grant => ['ALL'],
  }
}
