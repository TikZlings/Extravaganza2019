# clean up old video
rm NightDivine_combine.mp4

# convert to png images
convert -density 160 NightDivine_combine.pdf NightDivine_combine.png

# convert to video
ffmpeg -ss 00:00:00 -i NightDivine_combine-%d.png -ss 00:00:06 -i OHolyNight.m4a -shortest NightDivine_combine_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i NightDivine_combine_raw.mp4 -o NightDivine_combine.mp4

# clean up
rm NightDivine_combine-*.png
rm NightDivine_combine_raw.mp4

# view :)
open NightDivine_combine.mp4
