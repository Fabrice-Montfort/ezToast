#!/bin/sh

####
#
#  AUTO COMPILE ANE FROM AS3, ANDROID & IOS LIBRARIES WITH ADT
#
####

#
#  Locate Adobe AIR SDK
#
export PATH=$PATH:/Users/fabricemontfort/Documents/SDK/Feathers_3.5.0_-_AIR_30/bin

#
#  Delete current ANE
#
rm -f ./ezToast.ane

#
#  UNZIP current SWC (AS3 Library)
#
rm -rf ./tmp/
unzip -o -qq as3/bin/ezToast.swc -d tmp/

#
#  Copy unzipped AS3 Library (SWF) to build directory
#
cp tmp/library.swf ./build/android/
cp tmp/library.swf ./build/ios/
cp tmp/library.swf ./build/default/

#
#  Copy iOS Library to build directory
#
rm -rf ./build/ios/libezToast.a
cp -fR -L ./ios/ezToast/DerivedData/Build/Products/Release-iphoneos/libezToast.a ./build/ios/libezToast.a

#
#  Copy Android Library to build directory
#
rm -rf ./build/android/eztoast.jar
cp -fR -L ./android/bin/eztoast.jar ./build/android/eztoast.jar

#
#  Build the ANE with ADT
#
adt -package -target ane ./bin/ezToast.ane ./build/extension.xml -swc ./as3/bin/ezToast.swc -platform Android-ARM -C ./build/android/ . -platform iPhone-ARM -C ./build/ios/ . -platformoptions ./build/platformoptions.xml -platform default -C ./build/default/ .