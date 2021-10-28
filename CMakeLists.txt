# CMake minimum required version
cmake_minimum_required(VERSION 3.12)

# Pull in SDK (must be before project)
include(pico_sdk_import.cmake)
include(rp2040_hat_aws_c-patch.cmake)

# Set project name
set(PROJECT_NAME RP2040-HAT-AWS-C)

# Set project informations
project(${PROJECT_NAME} C CXX ASM)

set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)

# Initialize the SDK
pico_sdk_init()

add_definitions(-DMBEDTLS_CONFIG_FILE="${CMAKE_SOURCE_DIR}/interface/ssl_config.h")
add_definitions(-DHTTP_DO_NOT_USE_CUSTOM_CONFIG)
add_definitions(-DMQTT_DO_NOT_USE_CUSTOM_CONFIG)

# Hardware-specific examples in subdirectories:
add_subdirectory(examples)

# Add interface in subdirectories
add_subdirectory(interface)

# Add libraries in subdirectories
add_subdirectory(libraries)

# Set compile options
add_compile_options(
		-Wall
        -Wno-format          # int != int32_t as far as the compiler is concerned because gcc has int32_t as long int
        -Wno-unused-function # we have some for the docs that aren't called
        -Wno-maybe-uninitialized
        )
