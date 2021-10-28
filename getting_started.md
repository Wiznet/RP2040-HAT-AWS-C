# AWS IoT SDK Example Getting Started

These sections will guide you through a series of steps from configuring development environment to running AWS IoT SDK examples using the **WIZnet's ethernet products**.

- [**Development environment configuration**](#development_environment_configuration)
- [**Hardware requirements**](#hardware_requirements)
- [**AWS IoT SDK example structure**](#aws_iot_sdk_example_structure)
- [**AWS IoT SDK example testing**](#aws_iot_sdk_example_testing)



<a name="development_environment_configuration"></a>
## Development environment configuration

To test the AWS IoT SDK examples, the development environment must be configured to use Raspberry Pi Pico.

The AWS IoT SDK examples were tested by configuring the development environment for **Windows**. Please refer to the '**9.2. Building on MS Windows**' section of '**Getting started with Raspberry Pi Pico**' document below and configure accordingly.

- [**Getting started with Raspberry Pi Pico**][link-getting_started_with_raspberry_pi_pico]



<a name="hardware_requirements"></a>
## Hardware requirements

The AWS IoT SDK examples use **Raspberry Pi Pico** and **WIZnet Ethernet HAT** ethernet I/O module built on WIZnet's [**W5100S**][link-w5100s] ethernet chip or **W5100S-EVB-Pico** ethernet I/O module built on [**RP2040**][link-rp2040] and WIZnet's [**W5100S**][link-w5100s] ethernet chip.

- [**Raspberry Pi Pico**][link-raspberry_pi_pico]

![][link-raspberry_pi_pico_main]

- [**WIZnet Ethernet HAT**][link-wiznet_ethernet_hat]

![][link-wiznet_ethernet_hat_main]

- [**W5100S-EVB-Pico**][link-w5100s-evb-pico]

![][link-w5100s-evb-pico_main]



<a name="aws_iot_sdk_example_structure"></a>
## AWS IoT SDK example structure

AWS IoT SDK examples are available at '**RP2040-HAT-AWS-C/examples/**' directory. As of now, following examples are provided.

- [**HTTP & HTTPS**][link-http_https]
- [**Connect AWS IoT through MQTT**][link-connect_aws_iot_through_mqtt]

Note that **ioLibrary_Driver** is needed to run AWS IoT SDK examples. This library is applicable to WIZnet's W5x00 ethernet chip and is located in the '**RP2040-HAT-AWS-C/libraries/**' directory.

- [**ioLibrary_Driver**][link-ioLibrary_driver]



<a name="aws_iot_sdk_example_testing"></a>
## AWS IoT SDK example testing

Please refer to 'README.md' in each examples directory to find detail guide for testing AWS IoT SDK examples.



<!--
Link
-->

[link-getting_started_with_raspberry_pi_pico]: https://datasheets.raspberrypi.org/pico/getting-started-with-pico.pdf
[link-w5100s]: https://docs.wiznet.io/Product/iEthernet/W5100S/overview
[link-rp2040]: https://www.raspberrypi.org/products/rp2040/
[link-raspberry_pi_pico]: https://www.raspberrypi.org/products/raspberry-pi-pico/
[link-raspberry_pi_pico_main]: https://github.com/Wiznet/RP2040-HAT-AWS-C/blob/main/static/images/getting_started/raspberry_pi_pico_main.png
[link-wiznet_ethernet_hat]: https://docs.wiznet.io/Product/Open-Source-Hardware/wiznet_ethernet_hat
[link-wiznet_ethernet_hat_main]: https://github.com/Wiznet/RP2040-HAT-AWS-C/blob/main/static/images/getting_started/wiznet_ethernet_hat_main.png
[link-w5100s-evb-pico]: https://docs.wiznet.io/Product/iEthernet/W5100S/w5100s-evb-pico
[link-w5100s-evb-pico_main]: https://github.com/Wiznet/RP2040-HAT-AWS-C/blob/main/static/images/getting_started/w5100s-evb-pico_main.png
[link-http_https]: https://github.com/Wiznet/RP2040-HAT-AWS-C/tree/main/examples/AWS_IoT_HTTP
[link-connect_aws_iot_through_mqtt]: https://github.com/Wiznet/RP2040-HAT-AWS-C/tree/main/examples/AWS_IoT_MQTT
[link-ioLibrary_driver]: https://github.com/Wiznet/ioLibrary_Driver
