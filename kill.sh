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


