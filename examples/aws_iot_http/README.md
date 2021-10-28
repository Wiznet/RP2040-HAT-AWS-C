# How to Test AWS IoT HTTP Example


## Step 1: Prepare software

The following serial terminal program is required for AWS IoT HTTP test, download and install from below links.

- [**Tera Term**][link-tera_term]



## Step 2: Prepare hardware

1. Combine RP2040-HAT-C with Raspberry Pi Pico.

2. Connect ethernet cable to RP2040-HAT-C ethernet port.

3. Connect Raspberry Pi Pico to desktop or laptop using 5 pin micro USB cable.

If you are W5100S-EVB-Pico, you can skip '1. Combine...'

## Step 3: Setup AWS IoT HTTP Example

To test the AWS IoT HTTP example, minor settings shall be done in code.

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

If you want to test with the AWS IoT HTTP example using SPI DMA, uncommnet USE_SPI_DMA.

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

Input an https or http address in this macro.

```c++
#define HTTP_GET_URL   "https: //www.wiznet.io/"
```

4. Set-up device certificate and key.

If you want to change root certificate, client certificate and private key, you need to change the below sections.

Device certificate and key can be set in http_certificate.h in 'RP2040-HAT-AWS-C/Interface/' directory.

```
uint8_t http_root_ca[] = \
"-----BEGIN CERTIFICATE-----\r\n"
"...."
"-----END CERTIFICATE-----\r\n\0";

uint8_t http_client_cert[] = \
"-----BEGIN CERTIFICATE-----\r\n"
"..."
"-----END CERTIFICATE-----\r\n\0";

uint8_t http_private_key[] = \
"-----BEGIN RSA PRIVATE KEY-----\r\n"
"..."
"-----END RSA PRIVATE KEY-----\r\n\0";
```



## Step 4: Build

1. After completing the AWS IoT HTTP example configuration, click 'build' in the status bar at the bottom of Visual Studio Code or press the 'F7' button on the keyboard to build.

2. When the build is completed, 'AWS_IoT_HTTP.uf2' is generated in 'RP2040-HAT-AWS-C/build/examples/AWS_IoT_HTTP'.



## Step 5: Upload and Run

1. While pressing the BOOTSEL button of Raspberry Pi Pico power on the board, the USB mass storage 'RPI-RP2' is automatically mounted.

![][link-raspberry_pi_pico_usb_mass_storage]

2. Drag and drop 'AWS_IoT_HTTP.uf2' onto the USB mass storage device 'RPI-RP2'.

3. Connect to the serial COM port of Raspberry Pi Pico with Tera Term.

![][link-connect_to_serial_com_port]

4. Reset your board.



5. If the AWS_IoT_HTTP example works normally on Raspberry Pi Pico, you can see the **wiznet.io server IP** and **cipher suite**.

![][link-server_ip_ciphersuite]

6. Also, you can see HTTP body information.

![][link-http_body_information]

<!--
Link
-->

[link-tera_term]: https://osdn.net/projects/ttssh2/releases/
[link-raspberry_pi_pico_usb_mass_storage]: https://github.com/hyoyun-Kim/RP2040-AWS-v1/blob/main/static/images/AWS_IoT_HTTP/raspberry_pi_pico_usb_mass_storage.png
[link-connect_to_serial_com_port]: https://github.com/hyoyun-Kim/RP2040-AWS-v1/blob/main/static/images/AWS_IoT_HTTP/serial_com_port.png
[link-server_ip_ciphersuite]: https://github.com/hyoyun-Kim/RP2040-AWS-v1/blob/main/static/images/AWS_IoT_HTTP/server_ip_ciphersuite.png
[link-http_body_information]: https://github.com/hyoyun-Kim/RP2040-AWS-v1/blob/main/static/images/AWS_IoT_HTTP/http_body_information.png

