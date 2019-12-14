# clean up old video
rm ctan.mp4

# convert to png images
convert -density 160 ctan.pdf ctan.png

# convert to video
ffmpeg -ss 00:00:00 -i ctan-%d.png -ss 00:00:00 -i FactorySounds.m4a -shortest ctan_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i ctan_raw.mp4 -o ctan.mp4

# clean up
rm ctan-*.png
rm ctan_raw.mp4

# view :)
open ctan.mp4
