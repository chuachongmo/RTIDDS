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
    <value>peer2.pem</value>
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
Ensure you have the cacert.pem and peer2.pem file in the same directory as your exe file.

If not Go to Procedure to [Generate Self Signed Certification](https://github.com/chuachongmo/RTIDDS/blob/main/DDS_531/SecureDDS.md#procedure-to-generate-self-signed-certification)

### STEP 4:
Ensure you have the nddstransporttlsd.dll and nddstransporttls.dll in the same directory as your exe file.

If not Go to your NDDSHOME directory to copy the files.

### STEP 5:
Run your application. It should run as normal but with DTLS.  

# Procedure to Generate Self Signed Certification.

### STEP 1:
Download [openssl-1.0.2n](https://github.com/chuachongmo/RTIDDS/tree/main/openssl-1.0.2n)

Recommend to put the openssl-1.0.2n in C:\openssl-1.0.2n

### STEP 2:

Generate CACert by Running AutoGenCACert.bat

You can customize the script by changing the -subj "/C=SG/ST=Singpapore/L=Singapore/O=CCM/OU=CCM/CN=Not Applicable" in the AutoGenCACert.bat

*subj need to be exactly the same

You should get cacert.pem

### STEP 3:

Generate PeerCert by Running AutoGenPeerCert.bat

You can customize the script by changing the string "peer1" in the AutoGenPeerCert.bat

You can customize the script by changing the -subj "/C=SG/ST=Singpapore/L=Singapore/O=CCM/OU=CCM/CN=Not Applicable" in the autoCertReqPrivateKey.bat

*subj need to be exactly the same.

You should get peer1.pem


