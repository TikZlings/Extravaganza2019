# clean up old video
rm hippos.mp4

# convert to png images
convert -density 160 hippos_combine.pdf hippos.png

# convert to video
ffmpeg -ss 00:00:00 -i hippos-%d.png -ss 00:01:00 -i HippopotamusSong.m4a -shortest hippos_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i hippos_raw.mp4 -o hippos.mp4

# clean up
rm hippos-*.png
rm hippos_raw.mp4

# view :)
open hippos.mp4
