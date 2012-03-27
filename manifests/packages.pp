# Class: iptables::packages
#
# This module manages iptables packages
#
# Parameters:
#
# Actions: Installs iptables packages
#
# Requires:
#
# Sample Usage:
#   include iptables::packages
#
# [Remember: No empty lines between comments and class definition]
class iptables::packages {
  case $::osfamily {
    RedHat: {
      package { ['iptables', 'iptables-ipv6']:
        ensure => installed,
      }
    }
    Debian: {
      package { 'iptables':
        ensure => installed,
      }
      package { 'iptables-persistent':
        # iptables-persistent < 0.5 uses different rules files and/or
        # doesn't support IPv6. We need to make sure 0.5+ higher is installed.
        # Puppet has no built-in way to specify a minimum version.
        # This is a hack, it will try to "install" the package every puppet run
        ensure => '0.5*',
      }
    }
    default: {
      fail("Unsupported osfamily: ${::osfamily}",
      "operatingsystem: ${::operatingsystem}, module ${module_name}",
      "only support osfamily RedHat and Debian")
    }
  }
}
