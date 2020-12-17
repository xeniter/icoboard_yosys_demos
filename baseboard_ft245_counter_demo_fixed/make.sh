#!/bin/bash

rm read

set -e
cc read.c -o read -Wall -Wextra -lftd2xx -lpthread -lrt -Wl,-rpath /usr/local/lib -L/usr/local/lib
sudo ./read
