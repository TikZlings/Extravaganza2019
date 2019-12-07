# clean up old video
rm Cats.mp4

# convert to png images
convert -density 160 Cats_combine.pdf Cats.png

# convert to video
ffmpeg -ss 00:00:00 -i Cats-%d.png -ss 00:00:00 -i Memory.m4a -shortest Cats_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i Cats_raw.mp4 -o Cats.mp4

# clean up
rm Cats-*.png
rm Cats_raw.mp4

# view :)
open Cats.mp4
