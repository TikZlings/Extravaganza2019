# clean up old video
rm NightDivine.mp4

# convert to png images
convert -density 160 NightDivine_combine.pdf NightDivine.png

# convert to video
ffmpeg -ss 00:00:00 -i NightDivine-%d.png -ss 00:00:06 -i OHolyNight.m4a -shortest NightDivine_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i NightDivine_raw.mp4 -o NightDivine.mp4

# clean up
rm NightDivine-*.png
rm NightDivine_raw.mp4

# view :)
open NightDivine.mp4
