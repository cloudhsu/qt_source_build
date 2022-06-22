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
set -e

#---------------------------------#
#        Version example          #
#---------------------------------#
#   QT   |[major].[minor].[patch] #
#---------------------------------#
# Version|      6.      2.      4 #
# Version|      6.      0.      3 #
# Version|      5.     14.      2 #
#---------------------------------#

# https://download.qt.io/archive/qt/6.2/6.2.4/single/qt-everywhere-src-6.2.4.tar.xz
# https://download.qt.io/archive/qt/6.1/6.1.3/single/qt-everywhere-src-6.1.3.tar.xz
# https://download.qt.io/archive/qt/6.0/6.0.4/single/qt-everywhere-src-6.0.4.tar.xz
# https://download.qt.io/archive/qt/5.15/5.15.3/single/qt-everywhere-opensource-src-5.15.3.tar.xz
# https://download.qt.io/archive/qt/5.14/5.14.2/single/qt-everywhere-src-5.14.2.tar.xz

QT_VERSION=6.2
QT_PATH=3
QT_FULL_VERSION=${QT_VERSION}.${QT_PATH}

QT_SOURCE_FILE=qt-everywhere-src-${QT_FULL_VERSION}.tar.xz

echo "Script for build QT SDK ${QT_FULL_VERSION} static."

cmake_ver=$(cmake -version)

echo "QT6 need CMake 3.21, your CMake is ${cmake_ver}."
sleep 3

echo "Inspect source file exist or not..."
sleep 1
if  [[ ! -d qt-everywhere-src-${QT_FULL_VERSION} ]]; then
      if [[ -e $QT_SOURCE_FILE ]]; then
            echo "Already download source file from qt."
      else
            echo "Download qt ${QT_FULL_VERSION} source code and build static link."
            wget https://download.qt.io/archive/qt/${QT_VERSION}/${QT_FULL_VERSION}/single/$QT_SOURCE_FILE
      fi
      echo "Unzip ${QT_SOURCE_FILE}, please waiting..."
      tar xf $QT_SOURCE_FILE
fi

MTYPE=$(uname -m)

BUILD_FOLDER="build-qt-static-${OSTYPE}-${MTYPE}-${QT_FULL_VERSION}"

echo "Create build folder: ${BUILD_FOLDER}"
if [[ ! -d ${BUILD_FOLDER} ]]; then
      mkdir ${BUILD_FOLDER}
fi

prefix_path=$PWD/qt-static-${OSTYPE}-${MTYPE}-${QT_FULL_VERSION}

cd ${BUILD_FOLDER}

../qt-everywhere-src-${QT_FULL_VERSION}/configure \
      -opensource -confirm-license -release -strip -static \
      -feature-relocatable -no-feature-vulkan -no-gstreamer \
      -prefix $prefix_path -nomake examples -nomake tests \
      -skip qtwayland -skip qtwebview -skip qtwebengine -skip qtwebchannel \
      -skip qtspeech -skip qtlocation -skip qtpurchasing -skip qtgamepad \
      -skip qtvirtualkeyboard -skip qtscript -skip qtconnectivity \
      -skip qttranslations -skip qtsensors -skip qtserialbus -skip qtserialport -skip qtopcua \
      -skip qtcoap -skip qtmqtt

cmake --build . --parallel
cmake --install .

cd ..
# using tar.xz to tar
tar Jcvf qt-static-${OSTYPE}-${MTYPE}-${QT_FULL_VERSION}.tar.xz qt-static-${OSTYPE}-${MTYPE}-${QT_FULL_VERSION}
