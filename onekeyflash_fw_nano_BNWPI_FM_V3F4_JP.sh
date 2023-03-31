#!/bin/bash

echo "Stopping Pi-Star Services..."

sudo mount -o remount,rw /


sudo systemctl stop pistar-watchdog.timer
sudo systemctl stop pistar-watchdog.service
sudo systemctl stop mmdvmhost.timer
sudo systemctl stop nextiondriver.service
sudo systemctl stop mmdvmhost.service

sleep 3


echo "Killing any remaining MMDVMHost processes..."
sudo killall MMDVMHost
sudo killall MMDVMHost_NoOLED
sudo killall MMDVMHost_Adafruit

echo "Starting Flashing..."

sudo ./stm32flashV5 -v -w ./mmdvm_f4_20201214.hex -g 0x0 -R  -i 203,-6,6:-203,-6,6 /dev/ttyAMA0;
 
sleep 3

echo "Starting Pi-Star Services..."

sudo mount -o remount,ro /

sudo systemctl start pistar-watchdog.timer
sudo systemctl start pistar-watchdog
sudo systemctl start mmdvmhost.timer
sudo systemctl start nextiondriver.service
sudo systemctl start mmdvmhost


echo "Finnished..."
