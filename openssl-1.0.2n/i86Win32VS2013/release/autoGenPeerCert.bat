cd bin
set "CURDIR=%cd%"
set OPENSSL_CONF=%CURDIR%\openssl.cnf

set PEER=peer1
call "autoCertReqPrivateKey.bat" %PEER%
call "autoSignCert.bat" %PEER%
call "autoAppendPrivateKey.bat" %PEER%
copy ".\%PEER%.pem" "..\%PEER%.pem" /y

set PEER=peer2
call "autoCertReqPrivateKey.bat" %PEER%
call "autoSignCert.bat" %PEER%
call "autoAppendPrivateKey.bat" %PEER%
copy ".\%PEER%.pem" "..\%PEER%.pem" /y
	

