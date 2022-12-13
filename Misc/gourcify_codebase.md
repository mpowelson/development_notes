Commonly used as a send off for coworkers

* Combine submodules. See [here](https://github.com/acaudwell/Gource/wiki/Visualizing-Multiple-Repositories)
* Add directory with user image. See [this link](https://dev.to/wiseai/showcase-your-open-source-contributions-using-gource-53e4). You want a directory of images like "Ryan Kerwin.png". `--user-image-dir "./image_dir"`
* Render: Notice the follow user, directory and input source`gource -1280x720 -seconds-per-day 0.2 --auto-skip-seconds 0.2 --disable-bloom -background d0d3d4 --highlight-user "Ryan Kerwin" --follow-user "Ryan Kerwin" --camera-mode track --user-image-dir "./image_dir" --hide filenames,mouse,progress -o - combined_sub.txt | ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i - -vcodec libx264 -preset ultrafast -pix_fmt yuv420p -crf 1 -threads 0 -bf 0 gource_sub_ryan.mp4`

