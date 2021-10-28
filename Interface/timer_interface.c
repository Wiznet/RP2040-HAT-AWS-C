#include <stdio.h>
#include "pico/stdlib.h"
#include "timer_interface.h"
#include "dhcp.h"
#include "dns.h"

/* Timer  */
struct repeating_timer g_timer;
volatile uint32_t devtime_msec = 0;
volatile uint32_t g_msec_cnt = 0;



void timer_1ms_init(void)
{
    add_repeating_timer_us(-1000, repeating_timer_callback, NULL, &g_timer);
}

bool repeating_timer_callback(struct repeating_timer *t)
{
    devtime_msec++;
    g_msec_cnt++;

    if (g_msec_cnt >= 1000 - 1)
    {
        g_msec_cnt = 0;

        DHCP_time_handler();
        DNS_time_handler();
    }
}

time_t millis(void)
{
    return devtime_msec;
}
