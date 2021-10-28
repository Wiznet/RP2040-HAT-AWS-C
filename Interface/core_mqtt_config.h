/*
 * file					: core_http_config.h
 * description	: 
 * author				: Austin
 * company			: WIZnet
 * date					: 2021.05.27
 */

#ifndef _CORE_MQTT_CONFIG_H_
#define _CORE_MQTT_CONFIG_H_

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


/* Timeout */
#define MQTT_TIMEOUT                          10000  //10s
#define MQTT_DEFAULT_YIELD_TIMEOUT                          10  //10ms

#define MQTT_DOMAIN_SIZE                                        128

#define MQTT_BUF_SIZE                                           2048

/* Keep alive timeout */
#define MQTT_DEFAULT_KEEP_ALIVE						180		// seconds

/* Subscription number */
#define MQTT_SUBSCRIPTION_MAX_NUM					3

#if 0
#define LogError( message ) printf message
#define LogWarn( message ) printf message

#define LogInfo( message ) printf message

#define LogDebug( message ) printf message
#endif

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



#endif	/* _CORE_MQTT_CONFIG_H_ */
