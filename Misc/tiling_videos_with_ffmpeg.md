# Tiling Videos with FFmpeg 
## Tile 4 Videos
```
ffmpeg -i input1.mp4 -i input2.mp4 -i input3.mp4 -i input4.mp4 -filter_complex \
'[0:v]pad=iw*2:ih*2:0:0[int2];[int2][1:v]overlay=0:H/2[int3];[int3][2:v]overlay=W/2:0[int4];[int4][3:v]overlay=W/2:H/2[out]' \
-map [out] -c:v libx264 -crf 23 -preset veryfast output.mp4
```
## Tile 2 Videos (Same as stack vertically below)
```
ffmpeg -i input1.mp4 -i input2.mp4 -filter_complex '[0:v]pad=iw:ih*2:0:0[int2];[int2][1:v]overlay=0:H/2[out]' -map [out] -c:v libx264 -crf 23 -preset veryfast output.mp4
```

## Stack Horizontally
```
ffmpeg -i left.mp4 -i right.mp4 -filter_complex hstack output.mp4
```

## Stack Vertically
```
ffmpeg -i top.mp4 -i bottom.mp4 -filter_complex vstack output.mp4
```
