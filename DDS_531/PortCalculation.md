## [Formula For UDP Port Calucation For Meta Data](https://community.rti.com/static/documentation/connext-dds/5.3.1/doc/manuals/connext_dds/html_files/RTI_ConnextDDS_CoreLibraries_UsersManual/index.htm#UsersManual/Inbound_Ports_for_Meta_Traffic.htm#discovery_507287096_366425)

## [Formula For UDP Port Calucation For User Data](https://community.rti.com/static/documentation/connext-dds/5.3.1/doc/manuals/connext_dds/html_files/RTI_ConnextDDS_CoreLibraries_UsersManual/index.htm#UsersManual/Inbound_Ports_for_User_Traffic.htm#discovery_507287096_366435)

## RTPS Well Known Ports Constants Definitions

```
port_base = 7400
domain_id_gain = 250
participant_id_gain = 2
builtin_multicast_port_offset = 0
builtin_unicast_port_offset = 10
user_multicast_port_offset = 1
user_unicast_port_offset = 11
```

## Formula for port used for receiving meta data using unicast 
```
metatraffic_unicast_port = port_base + 
    (domain_id_gain * Domain ID) +
    (participant_id_gain * participant_id) +
    builtin_unicast_port_offset 
```

## Formula for port used for receiving user data using unicast 
```
usertraffic_unicast_port = port_base + 
    (domain_id_gain * Domain ID) +
    (participant_id_gain * participant_id)+
    user_unicast_port_offset
```

[Well Known Ports Constants Definitions](https://community.rti.com/docs/html/api_cpp/group__DDSWireProtocolQosModule.html#g8e1c02e92ccc930c8b89cafeeaf95045)
