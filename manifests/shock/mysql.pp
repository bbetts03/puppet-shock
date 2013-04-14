
class shock::mysql {

  $mysqlconfig=hiera('mysql::server')
  class { 'mysql::server':
    config_hash => { 
      'root_password' =>  $mysqlconfig['rootpassword'],
      'port'          =>  '3306',
      'datadir'       =>  '/var/lib/mysql',
      'socket'        =>  '/var/lib/mysql/mysql.sock',
    }
  }

  class { 'mysql::php': }

}
