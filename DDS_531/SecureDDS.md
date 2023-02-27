# Procedure to create a RTI DDS Application with DTLS

This procedure assumes a working DDS Application with a valid USER_QOS_PROFILES.xml.

### STEP 1:
Go to USER_QOS_PROFILES.xml file used by the DDS application.


### STEP 2:
In USER_QOS_PROFILES.xml --> <qos_profile> --> <participant_qos> --> < property> , Add the following Code

  

```
<value>
  <element>
    <name>dds.transport.load_plugins</name>
    <value>dds.transport.DTLS.dtls1</value>
  </element>
  <element>
    <!-- Setting this property has no effect if linking statically and setting create_function_ptr. -->
    <name>dds.transport.DTLS.dtls1.library</name>
    <value>nddstransporttls</value>
    <!-- Must be this value if linking dynamically. -->
  </element>
  <element>
    <!-- Only needed if linking dynamically. -->
    <name>dds.transport.DTLS.dtls1.create_function</name>
    <value>NDDS_Transport_DTLS_create</value>
  </element>
  <element>
    <name>dds.transport.DTLS.dtls1.tls.verify.ca_file</name>
    <value>cacert.pem</value>
    <!-- Use the same file for different Domain Participants. -->
  </element>
  <element>
    <name>dds.transport.DTLS.dtls1.tls.identity.certificate_chain_file</name>
    <value>peer1.pem</value>
    <!-- Use different files for different Domain Participants. -->
  </element>
  <element>
    <name>dds.transport.DTLS.dtls1.dtls_handshake_resend_interval</name>
    <value>1000</value>
  </element>
  <element>
    <name>dds.transport.DTLS.dtls1.verbosity</name>
    <value>0</value>
  </element>
  <element>
    <name>dds.transport.DTLS.dtls1.security_verbosity</name>
    <value>0</value>
  </element>
  <element>
    <name>dds.transport.DTLS.dtls1.dtls_connection_liveliness_interval</name>
    <value>60</value>
  </element>
</value>
```


### STEP 3:
Ensure you have the cacert.pem and peer1.pem file in the same directory as your exe file.

If not Go to Procedure to [Generate Self Signed Certification](https://github.com/chuachongmo/RTIDDS/blob/main/DDS_531/SecureDDS.md#procedure-to-generate-self-signed-certification)

### STEP 4:
Ensure you have the nddstransporttlsd.dll and nddstransporttls.dll in the same directory as your exe file.

If not Go to your NDDSHOME directory to copy the files.

### STEP 5:
Run your application. It should run as normal but with DTLS.  

# Procedure to Generate Self Signed Certificates using openSSL

### STEP 1:
Download [openssl-1.0.2n](https://github.com/chuachongmo/RTIDDS/tree/main/openssl-1.0.2n)

Recommend to put the openssl-1.0.2n in C:\openssl-1.0.2n or any folder. 

### STEP 2:

Generate CACert by Running AutoGenCACert.bat (Found in .\openssl-1.0.2n\i86Win32VS2013\release)

You can customize the script by changing the -subj "/C=SG/ST=Singpapore/L=Singapore/O=CCM/OU=CCM/CN=Not Applicable" in the AutoGenCACert.bat

*subj need to be exactly the same

You should get cacert.pem

### STEP 3:

Generate PeerCert by Running AutoGenPeerCert.bat (Found in .\openssl-1.0.2n\i86Win32VS2013\release)

Enter "y" when prompted. 

You can customize the script by changing the string "peer1" in the AutoGenPeerCert.bat

```
set PEER=peer1
```

To generate more peer certificate, duplicate the code and change the peer1 to peer2 in AutoGenPeerCert.bat

```
set PEER=peer1
call "autoCertReqPrivateKey.bat" %PEER%
call "autoSignCert.bat" %PEER%
call "autoAppendPrivateKey.bat" %PEER%
copy ".\%PEER%.pem" "..\%PEER%.pem" /y
```

You can customize the script by changing the -subj "/C=SG/ST=Singpapore/L=Singapore/O=CCM/OU=CCM/CN=Not Applicable" in the autoCertReqPrivateKey.bat

*subj need to be exactly the same.

You should get peer1.pem and peer2.pem

Open the peer1.pem file should contains 2 parts
1. an identifying certificate which has been signed by the authority
2. the private key associated with the public key contained in the certificat

# RTI DDS DTLS

Data security is provided by wrapping all Connext DDS network traffic with the Datagram Transport
Layer Security (DTLS) protocol ([IETF RFC 4347](https://www.rfc-editor.org/rfc/rfc4347)). It uses TLS v1.1 specification (IETF RFC 4346). The RFC standards are implemented in [OpenSSL v1.0.2n](https://github.com/openssl/openssl/tree/OpenSSL_1_0_2n).


### DTLS Architecture

![image](https://user-images.githubusercontent.com/25761033/221497352-dc1129fb-1e62-47f6-a9f7-312d28008ba8.png)



In order to communicate securely, an instance of the secure plugin requires: 
1) a certificate authority (shared with all peers) --> e.g cacert.pem see [Generate Self Signed Certification](https://github.com/chuachongmo/RTIDDS/blob/main/DDS_531/SecureDDS.md#procedure-to-generate-self-signed-certification)
2) an identifying certificate which has been signed by the authority --> e.g peer1.pem see [Generate Self Signed Certification](https://github.com/chuachongmo/RTIDDS/blob/main/DDS_531/SecureDDS.md#procedure-to-generate-self-signed-certification)
3) the private key associated with the public key contained in the certificate --> e.g. peer1.pem see [Generate Self Signed Certification](https://github.com/chuachongmo/RTIDDS/blob/main/DDS_531/SecureDDS.md#procedure-to-generate-self-signed-certification)









