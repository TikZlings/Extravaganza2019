# clean up old video
rm goodbye.mp4

# convert to png images
convert -density 160 goodbye_combine.pdf goodbye.png

# convert to video
ffmpeg -ss 00:00:00 -i goodbye-%d.png -ss 00:00:10 -i AuldLangSyne.m4a -shortest goodbye_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i goodbye_raw.mp4 -o goodbye.mp4

# clean up
rm goodbye-*.png
rm goodbye_raw.mp4

# view :)
#open goodbye.mp4
