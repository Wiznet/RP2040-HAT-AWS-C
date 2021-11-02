# How to Test HTTP & HTTPS Example



## Step 1: Prepare software

The following serial terminal program is required for HTTP & HTTPS example test, download and install from below link.

- [**Tera Term**][link-tera_term]



## Step 2: Prepare hardware

If you are using W5100S-EVB-Pico, you can skip '1. Combine...'

1. Combine WIZnet Ethernet HAT with Raspberry Pi Pico.

2. Connect ethernet cable to WIZnet Ethernet HAT or W5100S-EVB-Pico ethernet port.

3. Connect Raspberry Pi Pico or W5100S-EVB-Pico to desktop or laptop using 5 pin micro USB cable.



## Step 3: Setup HTTP & HTTPS Example

To test the HTTP & HTTPS example, minor settings shall be done in code.

1. Set SPI port and pin.

Set the SPI interface you use.

```cpp
/* SPI */
#define SPI_PORT spi0

#define PIN_SCK 18
#define PIN_MOSI 19
#define PIN_MISO 16
#define PIN_CS 17
#define PIN_RST 20
```

If you want to test with the HTTP & HTTPS example using SPI DMA, uncommnet USE_SPI_DMA.

```cpp
/* Use SPI DMA */
//#define USE_SPI_DMA // if you want to use SPI DMA, uncomment.
```

2. Set network configuration such as IP.

We are going to use DHCP. However, If you want to use 'Static IP' set the IP and other network settings to suit your network environment.

```cpp
/* Network */
static wiz_NetInfo g_net_info =
    {
        .mac = {0x00, 0x08, 0xDC, 0x12, 0x34, 0x56}, // MAC address
        .ip = {192, 168, 11, 2},                     // IP address
        .sn = {255, 255, 255, 0},                    // Subnet Mask
        .gw = {192, 168, 11, 1},                     // Gateway
        .dns = {8, 8, 8, 8},                         // DNS server
        .dhcp = NETINFO_DHCP                         // DHCP enable/disable
};
```

3. Input address.

Input an HTTP or HTTPS address in this macro.

```cpp
#define HTTP_GET_URL   "https://www.wiznet.io/"
```

4. Set-up device certificate and key.

If you want to change root certificate, client certificate and private key, you need to change the below sections.

Device certificate and key can be set in http_certificate.h in 'RP2040-HAT-AWS-C/Interface/' directory.

```cpp
uint8_t http_root_ca[] =
"-----BEGIN CERTIFICATE-----\r\n"
"...\r\n"
"-----END CERTIFICATE-----\r\n";

uint8_t http_client_cert[] =
"-----BEGIN CERTIFICATE-----\r\n"
"...\r\n"
"-----END CERTIFICATE-----\r\n";

uint8_t http_private_key[] =
"-----BEGIN RSA PRIVATE KEY-----\r\n"
"...\r\n"
"-----END RSA PRIVATE KEY-----\r\n";

```



## Step 4: Build

1. After completing the HTTP & HTTPS example configuration, click 'build' in the status bar at the bottom of Visual Studio Code or press the 'F7' button on the keyboard to build.

2. When the build is completed, 'aws_iot_http.uf2' is generated in 'RP2040-HAT-AWS-C/build/examples/aws_iot_http/'.



## Step 5: Upload and Run

1. While pressing the BOOTSEL button of Raspberry Pi Pico or W5100S-EVB-Pico power on the board, the USB mass storage 'RPI-RP2' is automatically mounted.

![][link-raspberry_pi_pico_usb_mass_storage]

2. Drag and drop 'aws_iot_http.uf2' onto the USB mass storage device 'RPI-RP2'.

3. Connect to the serial COM port of Raspberry Pi Pico or W5100S-EVB-Pico with Tera Term.

![][link-connect_to_serial_com_port]

4. Reset your board.

5. If the HTTP & HTTPS example works normally, you can see the **wiznet.io server IP** and **cipher suite**.

![][link-server_ip_ciphersuite]

6. Also, you can see HTTP body information.

![][link-http_body_information]



<!--
Link
-->

[link-tera_term]: https://osdn.net/projects/ttssh2/releases/
[link-raspberry_pi_pico_usb_mass_storage]: https://github.com/Wiznet/RP2040-HAT-AWS-C/blob/main/static/images/aws_iot_http/raspberry_pi_pico_usb_mass_storage.png
[link-connect_to_serial_com_port]: https://github.com/Wiznet/RP2040-HAT-AWS-C/blob/main/static/images/aws_iot_http/serial_com_port.png
[link-server_ip_ciphersuite]: https://github.com/Wiznet/RP2040-HAT-AWS-C/blob/main/static/images/aws_iot_http/server_ip_ciphersuite.png
[link-http_body_information]: https://github.com/Wiznet/RP2040-HAT-AWS-C/blob/main/static/images/aws_iot_http/http_body_information.png
