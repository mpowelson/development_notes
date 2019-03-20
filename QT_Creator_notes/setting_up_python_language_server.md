# Setting up QT Creator with a python language server
Using version 4.8.0-rc1
## Install Language server
https://github.com/palantir/python-language-server

```sudo pip install 'python-language-server[all]'```

Note that there are at least 2 others that you could try. See them here https://langserver.org/
## Setup QT Creator
Taken from https://doc.qt.io/qtcreator/creator-language-servers.html


* Enable the language server client by selecting Help > About Plugins > Other Languages > Language Client (or Qt Creator > About Plugins > Other Languages > Language Client on macOS).

* Restart Qt Creator to load the language client plugin.

* Select Tools > Options > Language Client (or Qt Creator > Preferences > Language Client > on macOS) to view a list of language servers.
"Language client options page"

* Select the check box next to the language server name to enable the language server.

* Select Add to add language servers.

* In the Name field, enter a name for the language server.

* In the Language field, select Set MIME Types to select the MIME types of the files to send to the language server (text/x-python). In the field below, you can enter file patterns to extend the MIME types, separated by semicolons.

* In the Executable field, enter the path to the language server executable (For me, `/usr/local/bin/pyls`)

* In the Arguments field, enter any required command line arguments (-v).

## Starting Language server
Be sure that your new language server is enabled (box checked). Now save and close QT Creator

In order for the language server to get your ROS environment, you need to launch QT Creator from a terminal (which has the ROS setup stuff in the .bashrc). Do that with 
```qtcreator-ros```
