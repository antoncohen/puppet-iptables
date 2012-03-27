# Class: iptables::services
#
# This module manages iptables services
#
# Parameters:
#
# Actions: Ensures iptables services are running at boot
#
# Requires: iptables::packages
#
# Sample Usage:
#   include iptables::services
#
# [Remember: No empty lines between comments and class definition]
class iptables::services {
  case $::osfamily {
    RedHat: {
      service { ['iptables', 'ip6tables']:
        ensure => running,
        enable => true,
        hasrestart => true,
        hasstatus => true,
        require => Class['iptables::packages'],
      }
    }
    Debian: {
      service { 'iptables-persistent':
        ensure => running,
        enable => true,
        hasrestart => true,
        # Debian is stupid, I should really write and package proper init scripts
        status => '/usr/bin/test -f /proc/net/ip_tables_names && /usr/bin/test -f /proc/net/ip6_tables_names',
        stop => "/usr/sbin/invoke-rc.d ${name} flush",
        require => Class['iptables::packages'],
      }
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily}",
      "operatingsystem: ${::operatingsystem}, module ${module_name}",
      "only support osfamily RedHat and Debian")
    }
  }
}
