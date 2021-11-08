#ifndef __UTILS_H
#define __UTILS_H

#include <stdint.h>

#define FALSE 0
#define TRUE 1

#define htons(X) (X)
#define ntohs(X) (X)
#define htonl(X) (X)
#define ntohl(X) (X)

#if 1
#define MACSTR "%02x:%02x:%02x:%02x:%02x:%02x"
#define MAC2STR(a) (a)[0], (a)[1], (a)[2], (a)[3], (a)[4], (a)[5]
#endif

void _mid(char *src, char *s1, char *s2, char *sub);
void a2A(char *sbuf, char *dbuf);
uint8_t is_macaddr(uint8_t *macstr, uint8_t *digitstr, uint8_t *mac);
uint8_t is_ipaddr(uint8_t *ipaddr, uint8_t *ret_ip);
uint8_t is_hexstr(uint8_t *hexstr);
uint8_t str_to_hex(uint8_t *str, uint8_t *hex);
uint8_t is_hex(uint8_t hex);
int32_t is_zero_ether_addr(const uint8_t *addr);
int32_t is_broadcast_ether_addr(const uint8_t *addr);
int32_t is_multicast_ether_addr(const uint8_t *addr);
#endif
