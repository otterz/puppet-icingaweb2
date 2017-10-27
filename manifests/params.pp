# == Class icingaweb2::params
#
class icingaweb2::params {
  # Module variables
  $git_repo            = 'https://git.icinga.org/icingaweb2.git'
  $git_revision        = undef
  $install_method      = 'git'
  $manage_apache_vhost = false
  $manage_repo         = false

  # Template variables
  $admin_permissions                 = '*'
  $admin_users                       = 'icingaadmin'
  $auth_backend                      = 'db'
  $auth_resource                     = 'icingaweb_db'
  $auth_user_class                   = ''
  $auth_user_name_attribute          = ''
  $auth_base_dn                      = ''
  $auth_filter                       = ''
  $group_section                     = 'icingaweb2'
  $group_resource                    = undef
  $group_user_backend                = undef
  $group_class                       = undef
  $group_filter                      = undef
  $group_name_attribute              = undef
  $group_member_attribute            = undef
  $group_base_dn                     = undef
  $group_backend                     = undef
  $group_user_class                  = undef
  $resource_bind_dn                  = undef
  $resource_bind_pw                  = undef
  $resource_host                     = undef
  $resource_name                     = undef
  $resource_port                     = undef
  $resource_root_dn                  = undef
  $resource_encryption               = undef
  $ido_db                            = 'mysql'
  $ido_db_host                       = 'localhost'
  $ido_db_name                       = 'icingaweb2'
  $ido_db_pass                       = 'icingaweb2'
  $ido_db_port                       = '3306'
  $ido_db_user                       = 'icingaweb2'
  $ido_type                          = 'db'
  $log_application                   = 'icingaweb2'
  $log_level                         = 'ERROR'
  $log_method                        = 'syslog'
  $log_resource                      = 'icingaweb_db'
  $log_store                         = 'db'
  $pkg_repo_version                  = 'release'
  $template_auth                     = 'icingaweb2/authentication.ini.erb'
  $template_config                   = 'icingaweb2/config.ini.erb'
  $template_resources                ='icingaweb2/resources.ini.erb'
  $template_roles                    = 'icingaweb2/roles.ini.erb'
  $template_apache                   = 'icingaweb2/apache2.conf.erb'
  $web_db                            = 'mysql'
  $web_db_host                       = 'localhost'
  $web_db_name                       = 'icingaweb2'
  $web_db_pass                       = 'icingaweb2'
  $web_db_port                       = '3306'
  $web_db_prefix                     = 'icingaweb2_'
  $web_db_user                       = 'icingaweb2'
  $web_type                          = 'db'

  case $::osfamily {
    'RedHat': {
      $config_dir                        = '/etc/icingaweb2'
      $config_dir_mode                   = '0755'
      $config_dir_purge                  = false
      $config_dir_recurse                = false
      $config_file_mode                  = '0664'
      $config_group                      = 'icingaweb2'
      $config_user                       = 'icingaweb2'
      $pkg_ensure                        = present
      $pkg_list                          = ['icingaweb2']
      $pkg_repo_release_key              = 'http://packages.icinga.org/icinga.key'
      $pkg_repo_release_metadata_expire  = undef

      case $::operatingsystem {
        'Scientific': {
          $pkg_repo_release_url          = "http://packages.icinga.org/epel/${::operatingsystemmajrelease}/release"
          $pkg_repo_snapshot_url         = "http://packages.icinga.org/epel/${::operatingsystemmajrelease}/snapshot"
        }
        default: {
          $pkg_repo_release_url          = 'http://packages.icinga.org/epel/$releasever/release'
          $pkg_repo_snapshot_url         = 'http://packages.icinga.org/epel/$releasever/snapshot'
        }
      }

      $pkg_repo_snapshot_key             = 'http://packages.icinga.org/icinga.key'
      $pkg_repo_snapshot_metadata_expire = '1d'
      $web_root                          = '/usr/share/icingaweb2'

      $pkg_deps = [
        'php-gd',
        'php-intl',
        'php-ldap',
        'php-mysql',
        'php-pecl-imagick',
        'php-pgsql',
      ]
    }

    'Debian': {
      $config_dir                        = '/etc/icingaweb2'
      $config_dir_mode                   = '0755'
      $config_dir_purge                  = false
      $config_dir_recurse                = false
      $config_file_mode                  = '0644'
      $config_group                      = 'icingaweb2'
      $config_user                       = 'icingaweb2'
      $pkg_ensure                        = present
      $pkg_list                          = ['icingaweb2']
      $pkg_repo_release_key              = undef
      $pkg_repo_release_metadata_expire  = undef
      $pkg_repo_release_url              = undef
      $pkg_repo_snapshot_key             = undef
      $pkg_repo_snapshot_metadata_expire = undef
      $pkg_repo_snapshot_url             = undef
      $web_root                          = '/usr/share/icingaweb2'

      $pkg_deps = [
        'php-gd',
        'php-imagick',
        'php-intl',
        'php-ldap',
        'php-mysql',
        'php-pgsql',
      ]
    }

    default: {
      fail "Operating system ${::operatingsystem} is not supported."
    }
  }
}

