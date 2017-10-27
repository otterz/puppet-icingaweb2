# == Define: icingaweb2::config::authentication_ad
#
# Sets up an authentication definition for Active Directory
#
define icingaweb2::config::authentication_ad (
  $auth_section        = undef,
  $auth_resource       = undef,
  $backend             = 'msldap',
  $user_class          = 'user',
  $filter              = undef,
  $user_name_attribute = 'sAMAccountName',
  $base_dn             = undef,
){

  Ini_Setting {
    ensure  => present,
    section => $auth_section,
    require => File["${::icingaweb2::config_dir}/authentication.ini"],
    path    => "${::icingaweb2::config_dir}/authentication.ini",
  }

  ini_setting { "icingaweb2 authentication ${title} resource":
    setting => 'resource',
    value   => "\"${auth_resource}\"",
  }

  ini_setting { "icingaweb2 authentication ${title} backend":
    setting => 'backend',
    value   => "\"${backend}\"",
  }

  ini_setting { "icingaweb2 authentication ${title} user_class":
    setting => 'user_class',
    value   => "\"${user_class}\"",
  }

  ini_setting { "icingaweb2 authentication ${title} filter":
    setting => 'filter',
    value   => "\"${filter}\"",
  }

  ini_setting { "icingaweb2 authentication ${title} user_name_attribute":
    setting => 'user_name_attribute',
    value   => "\"${user_name_attribute}\"",
  }
}
