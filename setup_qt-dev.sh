#!/bin/bash
########################################################################
# CloudBox Cross-Platform Framework Project                            #
#                                                                      #
# All rights reserved.                                                 #
# This program is free to use, but the ban on selling behavior.        #
# Modify the program must keep all the original text description,      #
# and can only comment out the original code (not allowed to delete).  #
#                                                                      #
# Created by Cloud Hsu.                                                #
# Copyright CloudBox.                                                  #
########################################################################


# Install shell script
set -e

if which curl > /dev/null; then
    echo "To check curl ok."
else
    echo "Downloading curl."
    if [[ $OSTYPE == darwin* ]];then
        brew install curl
    else
        sudo apt install curl
    fi
fi
if which 7z > /dev/null; then
    echo "To check 7z ok."
else
    echo "Downloading 7zip."
    if [[ $OSTYPE == darwin* ]];then
        brew install p7zip
    else
        sudo apt install p7zip-full
    fi
fi

if which wget > /dev/null; then
    echo "To check wget ok."
else
    echo "Downloading wget."
    if [[ $OSTYPE == darwin* ]];then
        brew install wget
    else
        sudo apt install wget
    fi
fi

if [[ ! -d "$HOME/QT" ]]; then
    mkdir -p $HOME/QT
fi

if [[ ! -d "$HOME/QT/QtCreator" ]]; then
    mkdir -p $HOME/QT/QtCreator
fi

if [[ ! -d "$HOME/QT/SDK" ]]; then
    mkdir -p $HOME/QT/SDK
fi

#-----------------------------------------#
#   QT Creator |  [major].[minor].[patch] #
#-----------------------------------------#
#    Version   |       7.      0.      2  #
#    Version   |       6.      0.      2  #
#    Version   |       5.      0.      3  #
#-----------------------------------------#

CREATOR_MAJOR=7
CREATOR_MINOR=0
CREATOR_PATCH=2

bash ./install_qt-creator.sh ${CREATOR_MAJOR} ${CREATOR_MINOR} ${CREATOR_PATCH}

#---------------------------------#
#   QT   |[major].[minor].[patch] #
#---------------------------------#
# Version|      6.      2.      3 #
# Version|      5.     14.      2 #
#---------------------------------#

QT_MAJOR=5
QT_MINOR=14
QT_PATCH=2

bash ./install_qt-sdk.sh ${QT_MAJOR} ${QT_MINOR} ${QT_PATCH}
