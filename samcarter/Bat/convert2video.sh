# clean up old video
rm bat.mp4

# convert to png images
convert -density 160 bat_combined.pdf bat.png

# convert to video
ffmpeg -ss 00:00:00 -i bat-%d.png -ss 00:02:55 -i BatOutofHell.m4a -shortest bat_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i bat_raw.mp4 -o bat.mp4

# clean up
rm bat-*.png
rm bat_raw.mp4

# view :)
open bat.mp4
