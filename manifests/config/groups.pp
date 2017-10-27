# Define for setting IcingaWeb2 groups
#
define icingaweb2::config::groups (
  $group_section             = undef,
  $group_resource            = undef,
  $group_class               = undef,
  $group_filter              = undef,
  $group_name_attribute      = undef,
  $group_member_attribute    = undef,
  $group_base_dn             = undef,
  $group_backend             = undef,
  $group_nested_group_search = false,
  $group_user_class          = undef,
) {

  Ini_Setting {
    ensure  => present,
    section => $group_section,
    require => File["${::icingaweb2::config_dir}/groups.ini"],
    path    => "${::icingaweb2::config_dir}/groups.ini",
  }

  ini_setting { "icingaweb2 groups ${group_section} resource":
    section => $group_section,
    setting => 'resource',
    value   => "\"${group_resource}\"",
  }

  ini_setting { "icingaweb2 groups ${group_section} group_class":
    section => $group_section,
    setting => 'group_class',
    value   => "\"${group_class}\"",
  }

  ini_setting { "icingaweb2 groups ${group_section} group_filter":
    section => $group_section,
    setting => 'group_filter',
    value   => "\"${group_filter}\"",
  }

  ini_setting { "icingaweb2 groups ${group_section} group_name_attribute":
    section => $group_section,
    setting => 'group_name_attribute',
    value   => "\"${group_name_attribute}\"",
  }

  ini_setting { "icingaweb2 groups ${group_section} group_member_attribute":
    section => $group_section,
    setting => 'group_member_attribute',
    value   => "\"${group_member_attribute}\"",
  }

  ini_setting { "icingaweb2 groups ${group_section} group_base_dn":
    section => $group_section,
    setting => 'group_base_dn',
    value   => "\"${group_base_dn}\"",
  }

  ini_setting { "icingaweb2 groups ${group_section} group_backend":
    section => $group_section,
    setting => 'backend',
    value   => "\"${group_backend}\"",
  }

  ini_setting { "icingaweb2 groups ${group_section} group_user_class":
    section => $group_section,
    setting => 'user_class',
    value   => "\"${group_user_class}\"",
  }

  if $group_nested_group_search {
    ini_setting { "icingaweb2 groups ${group_section} group_nested_group_search":
      section => $group_section,
      setting => 'nested_group_search',
      value   => "\"1\"",
    }
  }
}
