openssl req -nodes -new -newkey rsa:2048 -config openssl.cnf -keyout myCA/private/%1key.pem -out myCA/private/%1req.pem -subj "/C=SG/ST=Singpapore/L=Singapore/O=CCM/OU=CCM/CN=Not Applicable"


