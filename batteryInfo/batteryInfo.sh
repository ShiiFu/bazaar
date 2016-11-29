#!/bin/bash

upower -i /org/freedesktop/UPower/devices/battery_BATC | grep -E "state|time\ to|percentage"
