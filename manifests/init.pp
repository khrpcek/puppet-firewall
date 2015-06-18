class firewall (
  $module_enable = $firewall::params::module_enable,
  $iptables_enable = $firewall::params::iptables_enable,
  $firewalld_enable = $firewall::params::firewalld_enable,
) inherits firewall::params {
  if $module_enable {
    case $::osfamily {
      'RedHat': {
        include firewall::service
      }
      default: {
        fail("Module ${module_name} is not supported on ${::operatingsystem}")
      }
    }   
  }
     
  elsif $module_enable == false {
    notice("Firewall Module is disabled")
  }
}
