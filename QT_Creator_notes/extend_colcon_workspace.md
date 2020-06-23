# Extend a Colcon Workspace

As of 6/23/2020 there is no equivalent to the catkin config file, so if you want to "extend" a workspace you just source the extended workspace and then build the target workspace. In QTCreator do this as follows

1) Under projects->build add a custom build step
2) Set command = `bash`
3) Set arguments = `/home/user/workspaces/ws_ext/install/setup.bash`
4) Move the build step to happen before the colcon step

Now the workspace will be sourced every time you build
