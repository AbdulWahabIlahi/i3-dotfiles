#!/usr/bin/env python3


import time

while True:
    current_date = time.strftime("%d-%m-%Y")
    print(current_date, flush=True)
    time.sleep(86400)
