#!/data/data/com.termux/files/usr/bin/sh -e 
# Copyright 2017 (c) all rights reserved 
# by S D Rausty https://sdrausty.github.io
#####################################################################
cd $HOME/buildAPKs
echo Updating buildAPKs.
git pull
echo "\`buildClocks.sh\` might need to load sources from 3 submodule repositories to build APKs. This may take a little while to complete. Please be patient if this script needs to download source code from https://github.com"
sleep 2
git submodule update --init ./sources/clocks
git submodule update --init ./sources/liveWallpapers
git submodule update --init ./sources/widgets
find ~/buildAPKs/sources/clocks/  -name AndroidManifest.xml \
	-execdir ~/buildAPKs/scripts/build/buildOne.sh {} \;
cd ~/buildAPKs/sources/liveWallpapers/android-clock-livewallpaper/
../../../scripts/build/buildOne.sh
cd ~/buildAPKs/sources/widgets/16-bit-clock/16-bit-clock/
../../../../scripts/build/buildOne.sh
cd ~/buildAPKs/sources/widgets/Android-MonthCalendarWidget/
../../../scripts/build/buildOne.sh
cd ~/buildAPKs/sources/widgets/clockWidget/
../../../scripts/build/buildOne.sh
cd ~/buildAPKs/sources/widgets/decimal-clock-widget/decimal-clock-widget
../../../../scripts/build/buildOne.sh
cd ~/buildAPKs/sources/widgets/unix-time-clock-widget/unix-time-clock
../../../../scripts/build/buildOne.sh
