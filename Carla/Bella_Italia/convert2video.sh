# clean up old video
rm BellaItalia.mp4

# convert to png images
convert -density 160 BellaItalia_combine.pdf BellaItalia.png

# convert to video
ffmpeg -ss 00:00:00 -i BellaItalia-%d.png -ss 00:01:25 -i UnEstateItaliana.m4a -shortest BellaItalia_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i BellaItalia_raw.mp4 -o BellaItalia.mp4

# clean up
rm BellaItalia-*.png
rm BellaItalia_raw.mp4

# view :)
open BellaItalia.mp4
