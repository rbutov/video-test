#!/bin/bash

# Create a 5-second video with a blue background and a moving red square
ffmpeg -y -f lavfi -t 5 -i color=c=green:s=3840x2160:r=60 \
       -f lavfi -t 5 -i color=c=blue:s=60x60:r=60 \
       -filter_complex "[0][1]overlay=x='if(eq(n,1),0,if(lte(n,300),n*(3840-60)/300,3840-60))':y='if(eq(n,1),0,if(lte(n,300),n*(2160-60)/300,2160-60))':eval=frame" \
       -c:v libx264 -pix_fmt yuv420p -crf 18 ./output2.mp4

# Extract the first frame as a high-quality JPEG
ffmpeg -y -i ./output2.mp4 -vf "select=eq(n\,0)" -q:v 3 ./first2.jpg

# Extract the last frame as a high-quality JPEG
ffmpeg -y -sseof -3 -i ./output2.mp4 -update 1 -q:v 1 ./last2.jpg
