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

echo "6" > /sys/class/gpio/export
echo "203" > /sys/class/gpio/export

echo "out" > /sys/class/gpio/gpio6/direction
echo "out" > /sys/class/gpio/gpio203/direction


sleep 3

echo "0" > /sys/class/gpio/gpio203/value

echo "0" > /sys/class/gpio/gpio6/value
echo "1" > /sys/class/gpio/gpio6/value

echo "in" > /sys/class/gpio/gpio6/direction 
echo "in" > /sys/class/gpio/gpio203/direction
echo "6" > /sys/class/gpio/unexport
echo "203" > /sys/class/gpio/unexport

sleep 15

echo "Starting Pi-Star Services..."

sudo mount -o remount,ro /

sudo systemctl start pistar-watchdog.timer
sudo systemctl start pistar-watchdog
sudo systemctl start mmdvmhost.timer
sudo systemctl start nextiondriver.service
sudo systemctl start mmdvmhost

echo "Finnished..."
