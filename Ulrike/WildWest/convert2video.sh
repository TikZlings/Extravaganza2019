# clean up old video
rm wildwest.mp4

# convert to png images
convert -density 160 wildwest.pdf wildwest.png

# convert to video
ffmpeg -ss 00:00:00 -i wildwest-%d.png -ss 00:01:30 -i Mundharmonika.m4a -shortest wildwest_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i wildwest_raw.mp4 -o wildwest.mp4

# clean up
rm wildwest-*.png
rm wildwest_raw.mp4

# view :)
open wildwest.mp4
