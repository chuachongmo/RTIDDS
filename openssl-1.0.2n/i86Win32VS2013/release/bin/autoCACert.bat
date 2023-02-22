openssl req -nodes -x509 -newkey rsa:2048 -keyout myCA/private/cakey.pem -out myCA/cacert.pem -days 36500 -config openssl.cnf -subj "/C=SG/ST=Singpapore/L=Singapore/O=CCM/OU=CCM/CN=Not Applicable"

