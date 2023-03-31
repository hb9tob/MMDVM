echo "6" > /sys/class/gpio/export
echo "203" > /sys/class/gpio/export

echo "out" > /sys/class/gpio/gpio6/direction
echo "out" > /sys/class/gpio/gpio203/direction

echo "1" > /sys/class/gpio/gpio203/value

echo "0" > /sys/class/gpio/gpio6/value
echo "1" > /sys/class/gpio/gpio6/value

sleep 3


#sudo ./stm32flashV5 -v -w ./mmdvm_f4_20201214.hex -g 0x0 -R  /dev/ttyAMA0;
 
sleep 3

echo "0" > /sys/class/gpio/gpio203/value

echo "0" > /sys/class/gpio/gpio6/value
echo "1" > /sys/class/gpio/gpio6/value

#echo "in" > /sys/class/gpio/gpio6/direction 
#echo "in" > /sys/class/gpio/gpio203/direction


#echo "6" > /sys/class/gpio/unexport
#echo "203" > /sys/class/gpio/unexport

echo "Finnished..."
