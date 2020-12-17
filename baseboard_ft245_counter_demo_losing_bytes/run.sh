#!/bin/bash

set -e

yosys -p 'synth_ice40 -top top -json demo.json' top.v
nextpnr-ice40 --hx8k --package ct256 --json demo.json --pcf demo.pcf --asc demo.asc   # run place and route
icepack demo.asc demo.bin    

icoprog -v -p < demo.bin


