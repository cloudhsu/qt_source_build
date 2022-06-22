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

#---------------------------------#
#   QT   |[major].[minor].[patch] #
#---------------------------------#
# Version|      6.      2.      3 #
# Version|      5.     14.      2 #
#---------------------------------#

QT_MAJOR=$1
QT_MINOR=$2
QT_PATCH=$3

QT_VERSION=${QT_MAJOR}.${QT_MINOR}
QT_FULL_VERSION=${QT_MAJOR}.${QT_MINOR}.${QT_PATCH}

echo "Downloading QT-SDK ${QT_FULL_VERSION} to install..."
echo "If download fail you can open https://github.com/cloudhsu/qt_source_build/releases to check."


cd $HOME/QT/SDK

FILE_NAME="qt-${OSTYPE}-x86_64-${QT_FULL_VERSION}.tar.xz"
SDK_NAME="https://github.com/cloudhsu/qt_source_build/releases/download/V${QT_FULL_VERSION}/${FILE_NAME}"

if [[ ! -e ${FILE_NAME} ]];then
    echo "Download from ${SDK_NAME}"
    wget ${SDK_NAME}
fi
tar xf ${FILE_NAME}

STATIC_FILE_NAME="qt-static-${OSTYPE}-x86_64-${QT_FULL_VERSION}.tar.xz"
STATIC_SDK_NAME="https://github.com/cloudhsu/qt_source_build/releases/download/V${QT_FULL_VERSION}/${STATIC_FILE_NAME}"

if [[ ! -e ${STATIC_FILE_NAME} ]];then
    echo "Download from ${STATIC_SDK_NAME}"
    wget ${STATIC_SDK_NAME}
fi
tar xf ${STATIC_FILE_NAME}