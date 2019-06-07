# Putting a git repo on a usb drive

This is useful when the computer you need to deploy code on does not have internet access

See these resources:
https://en.wikibooks.org/wiki/Git/Repository_on_a_USB_stick
https://stackoverflow.com/questions/5540883/whats-the-practical-difference-between-a-bare-and-non-bare-repository


Basically you just want to add the usb stick as a remote drive. Then push to it from your connected machine and pull from it on the unconnected machine.

1) First navigate to your drive. It is probably something like /media/username/drive_name. `/media/username/drive_name`

2) Create a directory for your repostitories (optional) `mkdir directory_name)`

3) Create a bare repository. 

Here you can either create it blank: `git init --bare /media/username/drive_name/repositories/repo_name`

Or you can clone a local repository: `git clone ~/local_repos/repo_name repo_name`

4) Then on any computer just add it as a remote to the local repo: `git remote add usb file:///media/repositories/foo`

You can also things like simply checkout the repo
