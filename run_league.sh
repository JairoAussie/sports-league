#!/bin/bash
#install the necessary gems if you don't have them
gem install bundle
bundle install
#clear the screen to start the app cleaned
clear
#run the app with the optional parameter
ruby index.rb $1