class firewall::service inherits firewall {
  if $iptables_enable {
    service { 'iptables':
      ensure => 'running',
      enable => 'true',
    }
  }
  elsif $iptables_enable == false {
    service { 'iptables':
      ensure => 'stopped',
      enable => false,
    }
  }
  case $::operatingsystemmajrelease {
    '7': {
      if $firewalld_enable {
        service { 'iptables':
        ensure => 'running',
        enable => 'true',
      }
    }
      elsif $firewalld_enable == false {
        service { 'iptables':
        ensure => 'stopped',
        enable => false,
        }
      }
    }
  }
}

    
