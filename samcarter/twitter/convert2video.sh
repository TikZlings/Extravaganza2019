# clean up old video
rm twitter.mp4

# convert to png images
convert -density 160 twitter.pdf twitter.png

# convert to video
ffmpeg -ss 00:00:00 -i twitter-%d.png -ss 00:00:15 -i BigBen.m4a -shortest twitter_raw.mp4

# repair video
HandBrakeCLI --crop 0:0:0:0  -i twitter_raw.mp4 -o twitter.mp4

# clean up
rm twitter-*.png
rm twitter_raw.mp4

# view :)
open twitter.mp4
