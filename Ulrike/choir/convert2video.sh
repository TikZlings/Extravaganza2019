# clean up old video
rm choir.mp4

# convert to png images
convert -density 160 choir.pdf choir.png

# convert to video
ffmpeg -ss 00:00:00 -i choir-%d.png -ss 00:01:14 -i TheKingsSingers.m4a -shortest choir_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i choir_raw.mp4 -o choir.mp4

# clean up
rm choir-*.png
rm choir_raw.mp4

# view :)
#open choir.mp4
