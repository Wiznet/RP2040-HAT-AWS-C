
#include <stdio.h>
#include "pico/stdlib.h"

/* Timer  */
void timer_1ms_init(void);
bool repeating_timer_callback(struct repeating_timer *t);
time_t millis(void);