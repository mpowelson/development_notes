# Creating an IK Fast for 4 DOF robot


1) [Install Docker](https://docs.docker.com/engine/install/ubuntu/)
2) Pull OpenRave Docker container `docker pull hamzamerzic/openrave`
3) Convert Xacro to URDF : `rosrun xacro xacro --inorder -o robot.urdf robot.xacro`
3) Convert URDF to DAE.
```
sudo apt install ros-melodic-collada-urdf
rosrun collada_urdf urdf_to_collada /path/to/robot.urdf /path/to/robot.dae
```

4) Get link info
```
sudo docker run --rm --env PYTHONPATH=/usr/local/lib/python2.7/dist-packages -v /path/to:/out hamzamerzic/openrave /bin/bash -c "cd /out; openrave-robot.py robot.dae --info links"

```

5) Generate IKFast

There are a bunch of arguments to this python script. IKType can be seen [here](http://openrave.org/docs/0.8.0/openravepy/ikfast/). `--free-index` is another one that might be of interest if you need to set a link as an input
```
sudo docker run --rm --env PYTHONPATH=/usr/local/lib/python2.7/dist-packages -v /path/to:/out hamzamerzic/openrave /bin/bash -c "cd /out; python /usr/local/lib/python2.7/dist-packages/openravepy/_openravepy_/ikfast.py --robot=robot.dae --iktype=Ray4D --baselink=21 --eelink=42 --savefile=ik_fast_output.cpp" --ik_tests=1000

```

## Notes
* Only certain IK types will work with 4 DOF robots Ray4D and TranslationXAxisAngle4D should work, but I was only able to generate one for Ray4D

