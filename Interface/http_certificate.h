/**
 * Copyright (c) 2021 WIZnet Co.,Ltd
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#ifndef _HTTP_CERTIFICATE_H_
#define _HTTP_CERTIFICATE_H_

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

#endif /* _HTTP_CERTIFICATE_H_ */
