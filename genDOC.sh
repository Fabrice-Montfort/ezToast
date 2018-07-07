#!/bin/sh

####
#
#  GENERATE DOC FROM AS3 SOURCE CODE
#
####

#
#  Set variables
#
binpath="/Users/fabricemontfort/Documents/SDK/Feathers_3.5.0_-_AIR_30/bin"
libpath="/Users/fabricemontfort/Documents/SDK/Feathers_3.5.0_-_AIR_30/frameworks/libs/air/"

#
#  Locate Adobe AIR SDK
#
export PATH=$PATH:$binpath

#
#  Create the documentation with ASDOC
#
asdoc -source-path as3/src/ -doc-classes com.fabricemontfort.air.ezToast -output doc -exclude-dependencies=true -library-path $libpath