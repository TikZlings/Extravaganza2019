# clean up old video
rm Cats_combine.mp4

# convert to png images
convert -density 160 Cats_combine.pdf Cats_combine.png

# convert to video
ffmpeg -ss 00:00:00 -i Cats_combine-%d.png -ss 00:00:00 -i Memory.m4a -shortest Cats_combine_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i Cats_combine_raw.mp4 -o Cats_combine.mp4

# clean up
rm Cats_combine-*.png
rm Cats_combine_raw.mp4

# view :)
open Cats_combine.mp4
