cd bin
set "CURDIR=%cd%"
set OPENSSL_CONF=%CURDIR%\openssl.cnf
call "autoCACert.bat"
copy ".\myCA\cacert.pem" "..\" /y	
	

