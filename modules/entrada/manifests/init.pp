class entrada (
  $destination = '/home/vagrant/public_html',
  $source = 'https://github.com/EntradaProject/entrada-1x.git',
  $environment = 'development',
) {
  stage { 'pre': }
  stage { 'post': }
  Stage['pre'] -> Stage['main'] -> Stage['post']

  class { 'entrada::dependencies': stage=> pre }
  class { 'entrada::database': stage=> main }
  class { 'entrada::webserver':
    environment => $environment,
    destination => $destination,
    stage=> main }
  class { 'entrada::code': 
    destination => $destination,
    stage=> main }
}
