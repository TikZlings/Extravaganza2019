#!/bin/bash

convert2video(){

    # repeat same image n-times
    pdflatex --jobname=$1-repeat "\def\filename{"$1"}\input{repeat-credits}"

    # clean up old video
    rm $1.mp4

    # convert to png images
    convert -density 160 $1-repeat.pdf $1.png

    # convert to video
    ffmpeg -r 10 -ss 00:00:00 -i $1-%d.png -ss 00:00:04 -i JingleBells.m4a -shortest $1_raw.mp4

    # repair video
    HandBrakeCLI --crop 0:0:0:0 -i $1_raw.mp4 -o $1.mp4

}

# clean previous videos
rm *.mp4


# Converting
convert2video extravaganza-2019-credits

# clean up
rm *.aux
rm *.log
rm *.nav
rm *.snm
rm *.toc
rm *.out
rm *-repeat.pdf
rm *.png
rm *_raw.mp4