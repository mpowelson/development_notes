Taken from https://github.com/tfoote/ros_astra_camera/blob/master/README
on May 24, 2019

His branch has an install script that is not on the original

1,first install astra udev file
$sudo ./install.sh

2,replug in the device  to recognize usb device correctly
 
3,goto catkin workshop dir and compiler astra_camera
$catkin_make --pkg astra_camera

4,run astra_camera
$roslaunch astra_launch astra.launch

5,you can use rviz or image_view to verify driver
