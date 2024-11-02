#!/usr/bin/env python3

import time

while True:
    current_time = time.strftime("%H:%M:%S")
    print(current_time, flush=True)
    time.sleep(1)
