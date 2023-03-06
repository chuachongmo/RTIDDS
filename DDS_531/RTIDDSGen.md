# Procedure to Generate a Basic Publisher and Subscriber with DTLS

## STEP 1
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

## STEP 2
Make sure openssl is installed

if NOT Download [openSSL 1.0.2n](https://github.com/chuachongmo/RTIDDS/tree/main/openssl-1.0.2n)

Recommend to put the openssl-1.0.2n in C:\openssl-1.0.2n


## STEP 3
Download [HelloWorld.idl](https://github.com/chuachongmo/RTIDDS/releases/download/PubSub/HelloWorld.idl)

Download [rtiddsgen531_vs2013.bat
](https://github.com/chuachongmo/RTIDDS/releases/download/PubSub/rtiddsgen531_vs2013.bat)

Copy in any folder

Run rtiddsgen531_vs2013.bat


## STEP 4
Make sure VS2013 is installed.

Open "HelloWorld-i86Win32VS2013.sln" with VS2013

Go to the HelloWorld_publisher.cxx file 

under comment --> // Modify the data to be written here, add

```
sample.msg("CCM Secure");
```

Compile the whole solution

You should get 2 files in ..\objs\i86Win32VS2013\

1.HelloWorld_publisher.exe

2.HelloWorld_subscriber.exe

Copy USER_QOS_PROFILES.xml into the ..\objs\i86Win32VS2013\

## STEP 5

[Modify USER_QOS_PROFILES.xml using this procedure](https://github.com/chuachongmo/RTIDDS/blob/main/DDS_531/SecureDDS.md#procedure-to-create-a-rti-dds-application-with-dtls)

## STEP 6

Run 

1.HelloWorld_publisher.exe

2.HelloWorld_subscriber.exe

If all steps are correct you should see the subscriber print "CCM Secure"

# Procedure to Verify DTLS is enabled for the DDS Applications

## STEP 1

Download and install [Latest Wireshark](https://www.wireshark.org/)

## STEP 2

Make sure HelloWorld_publisher and HelloWorld_subscriber is running

Select the correct network interface. In this guide use loopback as the network interface.

Inspect the captured packets you should see DTLS packets only

## STEP 3

Open RTI Administration Console

Add Peers 20@builtin.udpv4://localhost

Join Domain 0

Should not see any participant on Domain 0















