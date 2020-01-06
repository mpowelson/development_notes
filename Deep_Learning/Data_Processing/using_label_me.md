# Using Label Me

This refers to the repo here https://github.com/wkentaro/labelme.

Specifically I am using it to label images for semantic segmentation where I am only doing a binary classification.

## General Notes
* When labeling images that do not have any labels of interest, labelme will not currently (7/16/2019) allow jsons without any labels. I get around this by adding a pt label with the label "\_background\_" which is what labelme seems to label things that are not labels of interest, so it ends up invisible after conversion to png.

## Converting JSON to other File Formats
### PNG
The author of the repo provides a tool called labelme_json_to_dataset. However this only works on one json at a time. In fact, the author states that it is not intended for creating a whole dataset at once. Well I am ignoring this. Here is a bash script that takes a directory of json files and divides them into a directory of png masks and png visualizations with overlays.
```
#!/bin/bash

#This script converts a directory of json files created by labelme to directories of labels and overlays
To use put the json files and images in a ./labels_json directory and call this bash script. The results will be in labels_viz and labels directory
# Create directories we will use
mkdir -p .temp
mkdir -p labels
mkdir -p labels_viz
mkdir -p labels_json

# Loop over all of the filenames
for filename in ./labels_json/*.json; do
    # Print filename
    echo $filename
    # Run the conversion
    labelme_json_to_dataset -o .temp $filename
    # Move and rename the files
    mv ./.temp/label.png ./labels/$(basename $filename .json).png
    mv ./.temp/label_viz.png ./labels_viz/$(basename $filename .json).png
    # Exit on ctrl + c
    trap "echo Exiting...; exit;" SIGINT SIGTERM
done

# Remove the temporary directory
rm -r .temp
```
