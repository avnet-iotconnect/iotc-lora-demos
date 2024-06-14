#!/bin/bash

gpioset gpiochip6 8=1
sleep 0.1
gpioset gpiochip6 8=0
sleep 0.1
gpioget gpiochip6 8
sleep 0.5
