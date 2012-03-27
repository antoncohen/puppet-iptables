# IPTables #

A Puppet module that ensures the iptables packages are installed and the
iptables services are running on Red Hat and Debian-based hosts.

*Note: This is not an firewall module, use 
[puppetlabs-firewall](https://github.com/puppetlabs/puppetlabs-firewall)
for actual firewalling. All this module does is ensure that the required
packages and services are installed and running.*

**Warning: This module will not work for you on Debian 6 (squeeze),
it requires iptables-persistent 0.5.x. I backported 0.5.x from sid to
squeeze, which is why this module works for me.**

Uses the $osfamily fact introduced in facter 1.6.2 to select the correct
package and service names.

## Usage ##

    include iptables

## Author ##

* Anton Cohen <anton@antoncohen.com>
* [Source](https://github.com/antoncohen/puppet-iptables)
* [Homepage](http://www.antoncohen.com/)
* [@antoncohen](http://twitter.com/antoncohen)
