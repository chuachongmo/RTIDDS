openssl ca -create_serial -config openssl.cnf -days 36500 -in myCA/private/%1req.pem -out myCA/newcerts/%1cert.pem

