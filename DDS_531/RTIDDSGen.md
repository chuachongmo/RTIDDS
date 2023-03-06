# Procedure to Generate a Basic Publisher and Subscriber with DTLS

Make sure rtiddsgen is in your PATH

if NOT

```
set PATH="C:\Program Files\rti_connext_dds-5.3.1\bin"
```
  

Run
```
rtiddsgen -version
```
Check it is version 2.5.2


Make sure openssl is installed

if NOT Download [openSSL 1.0.2n](https://github.com/chuachongmo/RTIDDS/tree/main/openssl-1.0.2n)

Recommend to put the openssl-1.0.2n in C:\openssl-1.0.2n



Download HelloWorld.idl
Download rtiddsgen531_vs2013.bat


Copy in any folder

Run rtiddsgen531_vs2013.bat

Make sure VS2013 is installed.

Open "HelloWorld-i86Win32VS2013.sln" with VS2013

Compile the whole solution

You should get 2 files in ..\objs\i86Win32VS2013\
1.HelloWorld_publisher.exe
2.HelloWorld_subscriber.exe

Copy USER_QOS_PROFILES.xml into the ..\objs\i86Win32VS2013\











