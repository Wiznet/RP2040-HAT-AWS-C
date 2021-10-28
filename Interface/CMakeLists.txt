
include( ${CMAKE_SOURCE_DIR}/libraries/aws-iot-device-sdk-embedded-C/libraries/standard/coreHTTP/httpFilePaths.cmake )
include( ${CMAKE_SOURCE_DIR}/libraries/aws-iot-device-sdk-embedded-C/libraries/standard/coreMQTT/mqttFilePaths.cmake )

#add_library(coreHTTP_FILES STATIC
#        ${HTTP_SOURCES}
#)

add_library(INTERFACE_FILES STATIC
        dns_interface.c
        dns_interface.h
        http_transport_interface.c
        http_transport_interface.h
        mqtt_transport_interface.c
        mqtt_transport_interface.h
        ssl_transport_interface.c
        ssl_transport_interface.h
        timer_interface.c
        timer_interface.h
        ${HTTP_SOURCES}
        ${MQTT_SOURCES}
        ${MQTT_SERIALIZER_SOURCES}
        util.c
        )

target_include_directories(INTERFACE_FILES PUBLIC
        ${CMAKE_SOURCE_DIR}/libraries/ioLibrary_Driver/Ethernet
        ${CMAKE_SOURCE_DIR}/libraries/ioLibrary_Driver/Internet/dhcp
        ${CMAKE_SOURCE_DIR}/libraries/ioLibrary_Driver/Internet/dns
        ${CMAKE_SOURCE_DIR}/libraries/mbedtls/include
        ${CMAKE_SOURCE_DIR}/libraries/mbedtls/library
        ${HTTP_INCLUDE_PUBLIC_DIRS}
        ${MQTT_INCLUDE_PUBLIC_DIRS}
#        ${CMAKE_SOURCE_DIR}/libraries/aws-iot-device-sdk-embedded-C/coreHTTP/source/include
#        ${CMAKE_SOURCE_DIR}/libraries/aws-iot-device-sdk-embedded-C/coreHTTP/source/interface        
        )

target_link_libraries(INTERFACE_FILES PUBLIC
        pico_stdlib
        ETHERNET_FILES
        DNS_FILES
        mbedcrypto
        mbedx509
        mbedtls
        )