add_executable(aws_iot_http
        aws_iot_http.c
    )

target_include_directories(aws_iot_http PUBLIC
        ${CMAKE_SOURCE_DIR}/libraries/ioLibrary_Driver/Ethernet
        ${CMAKE_SOURCE_DIR}/libraries/ioLibrary_Driver/Internet/dhcp
        ${CMAKE_SOURCE_DIR}/libraries/ioLibrary_Driver/Internet/dns
        ${CMAKE_SOURCE_DIR}/libraries/mbedtls/include
        ${CMAKE_SOURCE_DIR}/libraries/mbedtls/library
        ${CMAKE_SOURCE_DIR}/interface
        )

target_link_libraries(aws_iot_http PUBLIC
        pico_stdlib
        hardware_spi
        hardware_dma
        ETHERNET_FILES
        DHCP_FILES
        DNS_FILES
        INTERFACE_FILES
        mbedcrypto
        mbedx509
        mbedtls
        )

pico_enable_stdio_usb(aws_iot_http 1)
pico_enable_stdio_uart(aws_iot_http 0)

pico_add_extra_outputs(aws_iot_http)
