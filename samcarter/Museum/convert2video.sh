# clean up old video
rm Museum.mp4

# convert to png images
convert -density 160 Museum.pdf Museum.png

# convert to video
ffmpeg -ss 00:00:00 -i Museum-%d.png -ss 00:00:50 -i PicturesAtAnExhibition.m4a -shortest Museum_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i Museum_raw.mp4 -o Museum.mp4

# clean up
rm Museum-*.png
rm Museum_raw.mp4

# view :)
open Museum.mp4
