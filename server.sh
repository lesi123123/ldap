#! /bin/bash
echo "127.0.1.1       lesi.net" >>/etc/hosts
sudo apt-get install -y slapd ldap-utils
sudo ufw allow "OpenLDAP LDAP"
ldapsearch -x -LLL -H ldap:/// -b dc=lesi,dc=net dn
cat > base.ldif <<EOF
dn: ou=gkrepek,dc=lesi,dc=net
objectClass: organizationalUnit
ou: gkrepek
dn: ou=user,dc=lesi,dc=net
objectClass: organizationalUnit
ou: user 
EOF
sudo ldapadd -x -D cn=admin,dc=lesi,dc=net -W -f base.ldif
