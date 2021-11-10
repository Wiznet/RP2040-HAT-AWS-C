# CMake minimum required version
cmake_minimum_required(VERSION 3.12)

# Find git
find_package(Git)

if(NOT Git_FOUND)
	message(FATAL_ERROR "Could not find 'git' tool for RP2040-HAT-AWS-C patching")
endif()

message("RP2040-HAT-AWS-C patch utils found")

set(RP2040_HAT_AWS_C_SRC_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
set(IOLIBRARY_DRIVER_SRC_DIR "${RP2040_HAT_AWS_C_SRC_DIR}/libraries/ioLibrary_Driver")
set(MBEDTLS_SRC_DIR "${RP2040_HAT_AWS_C_SRC_DIR}/libraries/mbedtls")
set(AWS_IOT_DEVICE_SDK_EMBEDDED_C_SRC_DIR "${RP2040_HAT_AWS_C_SRC_DIR}/libraries/aws-iot-device-sdk-embedded-C")
set(AWS_IOT_DEVICE_SDK_EMBEDDED_C_COREHTTP_SRC_DIR "${RP2040_HAT_AWS_C_SRC_DIR}/libraries/aws-iot-device-sdk-embedded-C/libraries/standard/coreHTTP")
set(AWS_IOT_DEVICE_SDK_EMBEDDED_C_COREMQTT_SRC_DIR "${RP2040_HAT_AWS_C_SRC_DIR}/libraries/aws-iot-device-sdk-embedded-C/libraries/standard/coreMQTT")
set(AWS_IOT_DEVICE_SDK_EMBEDDED_C_COREHTTP_HTTP_PARSER_SRC_DIR "${RP2040_HAT_AWS_C_SRC_DIR}/libraries/aws-iot-device-sdk-embedded-C/libraries/standard/coreHTTP/dependency/3rdparty/http_parser")
set(RP2040_HAT_AWS_C_PATCH_DIR "${RP2040_HAT_AWS_C_SRC_DIR}/patches")

if(EXISTS "${IOLIBRARY_DRIVER_SRC_DIR}/.git")
	message("cleaning ioLibrary_Driver...")
	execute_process(COMMAND ${GIT_EXECUTABLE} -C ${IOLIBRARY_DRIVER_SRC_DIR} clean -fdx)
	execute_process(COMMAND ${GIT_EXECUTABLE} -C ${IOLIBRARY_DRIVER_SRC_DIR} reset --hard)
	message("ioLibrary_Driver cleaned")
endif()

if(EXISTS "${MBEDTLS_SRC_DIR}/.git")
	message("cleaning mbedtls...")
	execute_process(COMMAND ${GIT_EXECUTABLE} -C ${MBEDTLS_SRC_DIR} clean -fdx)
	execute_process(COMMAND ${GIT_EXECUTABLE} -C ${MBEDTLS_SRC_DIR} reset --hard)
	message("mbedtls cleaned")
endif()

if(EXISTS "${AWS_IOT_DEVICE_SDK_EMBEDDED_C_SRC_DIR}/.git")
	message("cleaning aws-iot-device-sdk-embedded-C...")
	execute_process(COMMAND ${GIT_EXECUTABLE} -C ${AWS_IOT_DEVICE_SDK_EMBEDDED_C_SRC_DIR} clean -fdx)
	execute_process(COMMAND ${GIT_EXECUTABLE} -C ${AWS_IOT_DEVICE_SDK_EMBEDDED_C_SRC_DIR} reset --hard)
	message("aws-iot-device-sdk-embedded-C cleaned")
endif()

execute_process(COMMAND ${GIT_EXECUTABLE} -C ${RP2040_HAT_AWS_C_SRC_DIR} submodule update --init)

if(EXISTS "${AWS_IOT_DEVICE_SDK_EMBEDDED_C_COREHTTP_SRC_DIR}/.git")
	message("cleaning aws-iot-device-sdk-embedded-C coreHTTP...")
	execute_process(COMMAND ${GIT_EXECUTABLE} -C ${AWS_IOT_DEVICE_SDK_EMBEDDED_C_COREHTTP_SRC_DIR} clean -fdx)
	execute_process(COMMAND ${GIT_EXECUTABLE} -C ${AWS_IOT_DEVICE_SDK_EMBEDDED_C_COREHTTP_SRC_DIR} reset --hard)
	message("aws-iot-device-sdk-embedded-C coreHTTP cleaned")
endif()

if(EXISTS "${AWS_IOT_DEVICE_SDK_EMBEDDED_C_COREMQTT_SRC_DIR}/.git")
	message("cleaning aws-iot-device-sdk-embedded-C coreMQTT...")
	execute_process(COMMAND ${GIT_EXECUTABLE} -C ${AWS_IOT_DEVICE_SDK_EMBEDDED_C_COREMQTT_SRC_DIR} clean -fdx)
	execute_process(COMMAND ${GIT_EXECUTABLE} -C ${AWS_IOT_DEVICE_SDK_EMBEDDED_C_COREMQTT_SRC_DIR} reset --hard)
	message("aws-iot-device-sdk-embedded-C coreMQTT cleaned")
endif()

execute_process(COMMAND ${GIT_EXECUTABLE} -C ${AWS_IOT_DEVICE_SDK_EMBEDDED_C_SRC_DIR} submodule update --init)

if(EXISTS "${AWS_IOT_DEVICE_SDK_EMBEDDED_C_COREHTTP_HTTP_PARSER_SRC_DIR}/.git")
	message("cleaning aws-iot-device-sdk-embedded-C coreHTTP http_parser...")
	execute_process(COMMAND ${GIT_EXECUTABLE} -C ${AWS_IOT_DEVICE_SDK_EMBEDDED_C_COREHTTP_HTTP_PARSER_SRC_DIR} clean -fdx)
	execute_process(COMMAND ${GIT_EXECUTABLE} -C ${AWS_IOT_DEVICE_SDK_EMBEDDED_C_COREHTTP_HTTP_PARSER_SRC_DIR} reset --hard)
	message("aws-iot-device-sdk-embedded-C coreHTTP http_parser cleaned")
endif()

execute_process(COMMAND ${GIT_EXECUTABLE} -C ${AWS_IOT_DEVICE_SDK_EMBEDDED_C_COREHTTP_SRC_DIR} submodule update --init)

# ioLibrary_Driver patch
message("submodules ioLibrary_Driver initialised")

file(GLOB IOLIBRARY_DRIVER_PATCHES 
	"${RP2040_HAT_AWS_C_PATCH_DIR}/01_iolibrary_driver_ethernet_chip.patch" 
	"${RP2040_HAT_AWS_C_PATCH_DIR}/02_iolibrary_driver_ftp_client.patch"
	)

foreach(IOLIBRARY_DRIVER_PATCH IN LISTS IOLIBRARY_DRIVER_PATCHES)
	message("Running patch ${IOLIBRARY_DRIVER_PATCH}")
	execute_process(
		COMMAND ${GIT_EXECUTABLE} apply ${IOLIBRARY_DRIVER_PATCH}
		WORKING_DIRECTORY ${IOLIBRARY_DRIVER_SRC_DIR}
	)
endforeach()

# mbedtls patch
message("submodules mbedtls initialised")

file(GLOB MBEDTLS_PATCHES 
	"${RP2040_HAT_AWS_C_PATCH_DIR}/03_mbedtls_test_mode.patch"
	)

foreach(MBEDTLS_PATCH IN LISTS MBEDTLS_PATCHES)
	message("Running patch ${MBEDTLS_PATCH}")
	execute_process(
		COMMAND ${GIT_EXECUTABLE} apply --ignore-whitespace ${MBEDTLS_PATCH}
		WORKING_DIRECTORY ${MBEDTLS_SRC_DIR}
	)
endforeach()

# aws-iot-device-sdk-embedded-C coreHTTP patch
message("submodules aws-iot-device-sdk-embedded-C initialised")

file(GLOB AWS_IOT_DEVICE_SDK_EMBEDDED_C_COREHTTP_PATCHES 
	"${RP2040_HAT_AWS_C_PATCH_DIR}/04_aws_iot_device_sdk_embedded_c_corehttp_network_interface.patch"
	)

foreach(AWS_IOT_DEVICE_SDK_EMBEDDED_C_COREHTTP_PATCH IN LISTS AWS_IOT_DEVICE_SDK_EMBEDDED_C_COREHTTP_PATCHES)
	message("Running patch ${AWS_IOT_DEVICE_SDK_EMBEDDED_C_COREHTTP_PATCH}")
	execute_process(
		COMMAND ${GIT_EXECUTABLE} apply --ignore-whitespace ${AWS_IOT_DEVICE_SDK_EMBEDDED_C_COREHTTP_PATCH}
		WORKING_DIRECTORY ${AWS_IOT_DEVICE_SDK_EMBEDDED_C_COREHTTP_SRC_DIR}
	)
endforeach()
