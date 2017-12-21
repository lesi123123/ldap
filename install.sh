#! /bin/bash
export DEBIAN_FRONTEND=noninteractive
apt-get -y install libpam-ldap nscd ldap-utils
echo "base dc=lesi,dc=net" >>/etc/ldap.conf
echo "uri ldap://192.168.4.5" >>/etc/ldap.conf
echo "rootbinddn cn=admin,dc=lesi,dc=net" >>/etc/ldap.conf
sed -i -r 's/(^base)(\s+)(.*)/\base cn=admin,dc=lesi,dc=net/' /etc/ldap.conf
sed -i -r 's/(^uri)(\s+)(.*)/\ /' /etc/ldap.conf
echo "uri ldap://192.168.4.5" >>/etc/ldap.conf
sed -i -r 's/(^rootbinddn)(\s+)(.*)/\rrootbinddn cn=admin,dc=lesi,dc=net/' /etc/ldap.conf
sed -i -r 's/(^passwd:)(\s+)(.*)/\1\2compat ldap/' /etc/nsswitch.conf
sed -i -r 's/(^group:)(\s+)(.*)/\1\2compat ldap/' /etc/nsswitch.conf
sed -i -r 's/(^shadow:)(\s+)(.*)/\1\2compat ldap/' /etc/nsswitch.conf
sudo service nscd restart
