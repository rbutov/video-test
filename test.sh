#!/bin/bash

# Create a 5-second video with a blue background and a moving red square
ffmpeg -y -f lavfi -t 5 -i color=c=blue:s=3840x2160:r=30 \
       -f lavfi -t 5 -i color=c=red:s=100x100:r=30 \
       -filter_complex "[0][1]overlay=x='if(eq(n,1),0,if(lte(n,150),n*(3840-100)/150,3840-100))':y='if(eq(n,1),0,if(lte(n,150),n*(2160-100)/150,2160-100))':eval=frame" \
       -c:v libx264 -pix_fmt yuv420p -crf 18 ./output.mp4

# Extract the first frame as a high-quality JPEG
ffmpeg -y -i ./output.mp4 -vf "select=eq(n\,0)" -q:v 3 ./first.jpg

# Extract the last frame as a high-quality JPEG
ffmpeg -y -sseof -3 -i ./output.mp4 -update 1 -q:v 1 ./last.jpg
