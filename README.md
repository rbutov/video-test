# Video Generation Script

This repository contains a Bash script that generates a test video with specific visual elements using FFmpeg.

## Description

The script `test.sh` creates a 5-second video with the following characteristics:

- Resolution: 3840x2160 (4K)
- Frame rate: 30 fps
- Duration: 5 seconds
- Content: A blue background with a red square that moves diagonally across the screen

## Requirements

- FFmpeg installed on your system
- Bash shell environment

## Output Files

The script generates three files:

1. `output.mp4` - The main video file
2. `first.jpg` - A high-quality JPEG of the first frame
3. `last.jpg` - A high-quality JPEG of the last frame

## Usage

1. Make the script executable:

```bash
chmod +x test.sh
```

2. Run the script:

```bash
./test.sh
```

## Technical Details

- The video uses H.264 encoding with high quality settings (CRF 18)
- The moving square is 100x100 pixels
- The square moves diagonally from the top-left to the bottom-right corner
- The movement is completed in 150 frames (5 seconds at 30 fps)

## Notes

- The script uses FFmpeg's `lavfi` filter to generate the video
- The overlay filter is used to create the moving square effect
- The script automatically overwrites existing files (uses `-y` flag)
