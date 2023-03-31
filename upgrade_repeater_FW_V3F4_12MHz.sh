#!/bin/bash -x
#Purpose 
#http://pi-star:2222

#user: pi-star
#password: raspberry

#Make the root filesystem writable

sudo mount -o remount,rw / ;
	
cd ~
curl -OL https://www.bi7jta.org/files/fm-patch/firmware/mmdvm_f4.hex;
curl -OL https://www.bi7jta.org/files/fm-patch/firmware/stm32flashV5;
curl -OL https://www.bi7jta.org/files/fm-patch/firmware/v3f4_12MHz_flash.sh;

sudo chmod +x stm32flashV5;
sudo chmod +x v3f4_12MHz_flash.sh;
./v3f4_12MHz_flash.sh;

echo 'Upgrade completed,check if 100% flash successful, if yes then disconnect your power supply and power one again, otherwise run ./v3f4_12MHz_flash.sh again'
