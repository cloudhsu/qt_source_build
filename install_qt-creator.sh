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

#-----------------------------------------#
#   QT Creator |  [major].[minor].[patch] #
#-----------------------------------------#
#    Version   |       7.      0.      2  #
#    Version   |       6.      0.      2  #
#    Version   |       5.      0.      3  #
#-----------------------------------------#

CREATOR_MAJOR=$1
CREATOR_MINOR=$2
CREATOR_PATCH=$3

CREATOR_VERSION=${CREATOR_MAJOR}.${CREATOR_MINOR}

CREATOR_FULL_VERSION=${CREATOR_MAJOR}.${CREATOR_MINOR}.${CREATOR_PATCH}

echo "Downloading QT-Creator ${CREATOR_FULL_VERSION} to install..."
echo "If download fail you can open https://download.qt.io/official_releases/qtcreator/ to check."

cd $HOME/QT/QtCreator

mkdir -p ${CREATOR_FULL_VERSION}

# https://download.qt.io/official_releases/qtcreator/7.0/7.0.2/installer_source/mac_x64/qtcreator.7z
# https://download.qt.io/official_releases/qtcreator/7.0/7.0.2/installer_source/windows_x64/qtcreator.7z
# https://download.qt.io/official_releases/qtcreator/7.0/7.0.2/installer_source/linux_x64/qtcreator.7z

# https://download.qt.io/official_releases/qtcreator/6.0/6.0.2/installer_source/windows_x64/qtcreator.7z
# https://download.qt.io/official_releases/qtcreator/6.0/6.0.2/installer_source/mac_x64/qtcreator.7z
# https://download.qt.io/official_releases/qtcreator/6.0/6.0.2/installer_source/linux_x64/qtcreator.7z

OSPath="linux_x64"

if [[ $OSTYPE == darwin* ]];then
    OSPath="mac_x64"
fi

cd $HOME/QT/QtCreator/${CREATOR_FULL_VERSION}

DOWNLOAD_PATH="https://download.qt.io/official_releases/qtcreator/${CREATOR_VERSION}/${CREATOR_FULL_VERSION}/installer_source/${OSPath}/qtcreator.7z"

if [ ! -e qtcreator.7z ];then
    echo "Download from "${DOWNLOAD_PATH}
    #curl -fL0 ${DOWNLOAD_PATH}
    wget ${DOWNLOAD_PATH}
fi

if [[ $OSTYPE == darwin* ]];then
    if [ ! -e Qt Creator ];then
        7z x qtcreator.7z
    else
        echo "Qt Creator already installed."
    fi
else
    if [ ! -d bin ];then
        7z x qtcreator.7z
    else
        echo "Qt Creator already installed."
    fi
fi

# copy desktop file to /usr/share/applications for any user to be able to use it.
# ~/.local/share/applications