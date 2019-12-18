# clean up old video
rm tug.mp4

# convert to png images
convert -density 160 tug.pdf tug.png

# convert to video
ffmpeg -ss 00:00:00 -i tug-%d.png -ss 00:00:36 -i YankeeDoodle.m4a -shortest tug_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i tug_raw.mp4 -o tug.mp4

# clean up
#rm tug-*.png
rm tug_raw.mp4

# view :)
#open tug.mp4
