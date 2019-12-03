# clean up old video
rm island.mp4

# convert to png images
convert -density 160 island_combine.pdf island.png

# convert to video
ffmpeg -ss 00:00:00 -i island-%d.png -ss 00:00:08 -i LetItSnow.m4a -shortest island_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i island_raw.mp4 -o island.mp4

# clean up
#rm island-*.png
rm island_raw.mp4

# view :)
open island.mp4
