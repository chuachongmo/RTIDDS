# Procedure to Configure Routing Service to enable DTLS

The Default Routing Service do not have the neccessary libraries to load the DTLS transports

In this guide assumes you have the following

1. openssl-1.0.2n-target-i86Win32VS2010.zip
2. installed connext professional 5.3.1

Please ensure the following 

1. Create a new folder --> rtiroutingservice_531
2. Copy %NDDSHOME%\resource\app\bin\i86Win32VS2010\rti\rtiroutingservice.exe
3. Copy %NDDSHOME%\resource\app\lib\i86Win32VS2010 --> ensure you have nddstransporttls.dll
4. Extract openssl-1.0.2n-target-i86Win32VS2010.zip and place it in the folder rtiroutingservice_531
5. Copy your CACert.pem, peer1.pem , peer2.pem and place it in the folder rtiroutingservice_531 with the exe
6. 
