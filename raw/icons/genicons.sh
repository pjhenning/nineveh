#!/bin/sh

if [ "$(uname)" == "Darwin" ]; then
    PATH=$PATH:/Applications/Inkscape.app/Contents/MacOS/
fi

inkscape -w 512 -h 512 --export-area-page --export-filename=../../android/ic_launcher-web.png  icon.svg;


#DESKTOP
inkscape -w 16 -h 16 --export-area-page --export-filename=../../lwjgl3/src/main/resources/icon16.png  icon.svg;
inkscape -w 32 -h 32 --export-area-page --export-filename=../../lwjgl3/src/main/resources/icon32.png  icon.svg;
inkscape -w 64 -h 64 --export-area-page --export-filename=../../lwjgl3/src/main/resources/icon64.png  icon.svg;
inkscape -w 128 -h 128 --export-area-page --export-filename=../../lwjgl3/src/main/resources/icon128.png  icon.svg;


####### ICNS AND ICO
ICONS_DIR=tmp.iconset

mkdir -p $ICONS_DIR
inkscape -w 16 -h 16 --export-area-page -o $ICONS_DIR/icon16.png  icon.svg;
inkscape -w 32 -h 32 --export-area-page -o $ICONS_DIR/icon32.png  icon.svg;
#inkscape -w 64 -h 64 --export-area-page -o $ICONS_DIR/icon64.png  icon.svg;
inkscape -w 128 -h 128 --export-area-page -o $ICONS_DIR/icon128.png  icon.svg;
inkscape -w 256 -h 256 --export-area-page -o $ICONS_DIR/icon256.png  icon.svg;
inkscape -w 512 -h 512 --export-area-page -o $ICONS_DIR/icon512.png  icon.svg;
#inkscape -w 1024 -h 1024 --export-area-page -o $ICONS_DIR/icon1024.png  icon.svg;

#png2icns icon.icns icon16.png icon32.png icon64.png icon128.png icon256.png icon512.png icon1024.png

# 64x64 dimension not supported
# if macos use iconutil else use png2icns
if [ "$(uname)" == "Darwin" ]; then
    iconutil -c icns -o icon.icns $ICONS_DIR
else
    png2icns icon.icns $ICONS_DIR/*.png
fi

convert $ICONS_DIR/*.png icon.ico

mv  icon.ico ../../lwjgl3/icons/logo.ico
mv  icon.icns ../../lwjgl3/icons/logo.icns
cp  $ICONS_DIR/icon128.png ../../lwjgl3/icons/logo.png

rm -rf $ICONS_DIR

