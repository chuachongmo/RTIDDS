cd bin
call "autoCertReqPrivateKey.bat" peer1
call "autoSignCert.bat" peer1
call "autoAppendPrivateKey.bat" peer1
copy ".\peer1.pem" "..\peer1.pem" /y
	

