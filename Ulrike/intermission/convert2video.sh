#!/bin/bash

convert2video(){

    # repeat same image n-times
    pdflatex --jobname=$1-repeat "\def\filename{"$1"}\input{repeat}"

    # clean up old video
    rm $1.mp4

    # convert to png images
    convert -density 160 $1-repeat.pdf $1.png

    # convert to video
    ffmpeg -r 10 -ss 00:00:00 -i $1-%d.png -ss 00:00:04 -i JingleBells.m4a -shortest $1_raw.mp4

    # repair video
    HandBrakeCLI --crop 0:0:0:0 -i $1_raw.mp4 -o $1.mp4

}

# Converting
convert2video extravaganza-intermission-bat
convert2video extravaganza-intermission-ctan
convert2video extravaganza-intermission-italiana
convert2video extravaganza-intermission-twitter
convert2video extravaganza-intermission-arts
convert2video extravaganza-intermission-cat
convert2video extravaganza-intermission-hippos
convert2video extravaganza-intermission-night
convert2video extravaganza-intermission-wildwest
convert2video extravaganza-intermission-background
convert2video extravaganza-intermission-island
convert2video extravaganza-intermission-particleduck
convert2video extravaganza-intermission-finale
convert2video extravaganza-intermission-goodbye

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