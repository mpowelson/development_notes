# Fix Meshlab installed with Snap
The newest meshlab for Ubuntu at the time of writing is a snap package. However when installed it does not get registered as an application. This means that you cannot set it as the default application for mesh file extensions which is not ideal. This fixes that.

1) Add snap packages to application list.
Take from [HERE](https://askubuntu.com/questions/910821/programs-installed-via-snap-not-showing-up-in-launcher)

Add this snippet to your bashrc. Alternatively you could manually create these symlinks for each package.
```
for i in /var/lib/snapd/desktop/applications/*.desktop; do
    if [ ! -f ~/.local/share/applications/${i##*/} ];then
            ln -s /var/lib/snapd/desktop/applications/${i##*/} ~/.local/share/applications/${i##*/};
    fi;
done
```

2) I tried this and it still didn't work. I think this is because only meshlabserver has an Exec line. To fix this, add this line to the meshlab.desktop file that is symlinked there.
```
Exec=meshlab %f
```

Now, ~/.local/share/applications/meshlab_meshlab.desktop should look like

```
[Desktop Entry]
X-SnapInstanceName=meshlab
Type=Application
Name=MeshLab
Comment=Processor and editor of large 3D triangular meshes
Terminal=false
Exec=meshlab %f
Categories=Graphics;
Icon=/snap/meshlab/4/meta/gui/meshlab.png
```

You should now be able to right click on a mesh file and select meshlab to open it.
