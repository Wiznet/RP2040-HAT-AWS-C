/*
 * file					: core_http_config.h
 * description	: 
 * author				: Austin
 * company			: WIZnet
 * date					: 2021.05.27
 */

#ifndef _CORE_HTTP_CONFIG_H_
#define _CORE_HTTP_CONFIG_H_

/*
 * ----------------------------------------------------------------------------------------------------
 * Includes
 * ----------------------------------------------------------------------------------------------------
 */


/*
 * ----------------------------------------------------------------------------------------------------
 * Macros
 * ----------------------------------------------------------------------------------------------------
 */
/* Port */
#define HTTP_PORT												80
#define HTTPS_PORT												443

/* Timeout */
#define HTTP_TIMEOUT											10000	// 10s

#define HTTP_DOMAIN_SIZE                                        128

#define HTTP_BUF_SIZE                                           2048

#ifndef HTTP_CONTENT_TYPE_FIELD
    #define HTTP_CONTENT_TYPE_FIELD            "Content-Type"                             /**< HTTP header field "Content-Type". */
    #define HTTP_CONTENT_TYPE_FIELD_LEN				 ( sizeof( HTTP_CONTENT_TYPE_FIELD ) - 1U ) /**< The length of #HTTP_CONTENT_TYPE_FIELD. */
#endif

#ifndef HTTP_CONTENT_TYPE_VALUE
    #define HTTP_CONTENT_TYPE_VALUE  "application/octet-stream"
    #define HTTP_CONTENT_TYPE_VALUE_LEN        ( sizeof( HTTP_CONTENT_TYPE_VALUE ) - 1U ) /**< The length of #HTTP_CONTENT_TYPE_VALUE. */
#endif

#define HTTP_CONNECTION_CLOSE_VALUE    "close"
#define HTTP_CONNECTION_CLOSE_VALUE_LEN    ( sizeof( HTTP_CONNECTION_CLOSE_VALUE ) - 1U )

/*
 * ----------------------------------------------------------------------------------------------------
 * Variables
 * ----------------------------------------------------------------------------------------------------
 */

/*
 * ----------------------------------------------------------------------------------------------------
 * Functions
 * ----------------------------------------------------------------------------------------------------
 */



#endif	/* _CORE_HTTP_CONFIG_H_ */
