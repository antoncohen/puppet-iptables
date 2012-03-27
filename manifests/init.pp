# Class: iptables
#
# This module manages iptables
#
# Parameters:
#
# Actions: Installs iptables packages and services
#
# Requires:
#
# Sample Usage:
#   include iptables
#
# [Remember: No empty lines between comments and class definition]
class iptables {
  include iptables::packages
  include iptables::services
}
