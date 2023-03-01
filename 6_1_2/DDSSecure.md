# Overview of DDS Secure

Handles the following Cyber Threats
1. Unauthorized Subscription
2. Unauthorized Publication
3. Tampering And Replay
4. Crossing Domains


# DTLS vs DDS Secure

Domain-level protection can be achieved with DTLS or DDS Secure.

However, Domain-level protection is implemented differently see [Architecture For DDS Secure](https://github.com/chuachongmo/RTIDDS/edit/main/DDSSecure.md#architecture-for-dds-secure) and [Architecture For DTLS](https://github.com/chuachongmo/RTIDDS/blob/main/DDS_531/SecureDDS.md#dtls-architecture).

DTLS is implemented as a separate layer from the DDS Layer. Any connection/reconnection issue at the DTLS layer will not be handled by the DDS layer.

For example, DTLS Layer maybe disconnected and reconnecting while the DDS Layer maybe still sending. This may result in data loss and application may not be able to handle the event as its separated from the DDS Layer.


DDS Secure is implemented within the DDS Layer. Hence any existing Participant/Subscriber/Publisher/Data-reader/Data-writer liveliness QoS will be applicable.

DTLS do not support multicast, therefore your data will be re-encrypted as many times as the number of destinations, which seriously constrains your system’s scalability

DDS Secure supports secure multicast communications, so you can scale your one to multi-end communications.

DTLS you can protect the information that goes on the wire between two DDS applications, but you cannot, for instance, give different permissions to different applications. All of your applications must have the same level of access control, only the pipe is secured. 

With DDS Security, you have finer control, for instance, give an application permission to publish or subscribe 
1. Topic_with_NoEncryptionAndNoSignature
2. Topic_with_NoEncryptionAndSignature
3. Topic_with_EncryptionAndSignature

## Architecture For DDS Secure

![image](https://user-images.githubusercontent.com/25761033/222088203-edea3a54-9de8-42fc-9f05-18f6bd2356bf.png)

## [Architecture For DTLS](https://github.com/chuachongmo/RTIDDS/blob/main/DDS_531/SecureDDS.md#dtls-architecture)

