/**
 * Copyright (c) 2021 WIZnet Co.,Ltd
 *
 * SPDX-License-Identifier: BSD-3-Clause
 */

#ifndef _TIMER_INTERFACE_H_
#define _TIMER_INTERFACE_H_

#include <stdio.h>
#include "pico/stdlib.h"

/* Timer  */
void timer_1ms_init(void);
bool repeating_timer_callback(struct repeating_timer *t);
time_t millis(void);

#endif /* _TIMER_INTERFACE_H_ */
