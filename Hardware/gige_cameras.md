# Issues with Gig-E Cameras

Most of these came up when working with the Framos d435e. 

## Gig-E uses 8 wires
This may seem obvious, but we were under the impression that we only needed 4 pins. Thus when we ran ethernet through a robot toolchanger we just connected the 4 pins that normal ethernet uses. It turns out that Gig-E uses all 8. This resulted in seemingly odd things where we could ping a computer through the connection but the camera would not send data. POE uses the data lines to transmit power as well.

## Bandwidth issues
We ran into intermittent issues where sometimes we could get color or depth images but not both. Everything would be working fine until we rebooted the computer. Apparently this can be caused by needing to increase the network packet size and even if it has been set up a reboot in linux can erase those settings. [HERE](https://linuxconfig.org/how-to-enable-jumbo-frames-in-linux) are some instructions for increasing the packet size.

This is the important command. Apparently jumbo frames supports up to 9000. Be sure to replace etho0 with your network device
`ip link set eth0 mtu 9000`
