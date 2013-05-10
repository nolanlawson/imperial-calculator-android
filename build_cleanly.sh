#!/bin/bash
# builds the Android application using the nearby imperial-calculator WWW files.
# usage: build_cleanly.sh [uninstall_first] [skip_install_entirely]
#

uninstall_first=$1
skip_install_entirely=$2

sed_command='sed'

if [ $(uname) == 'Darwin' ]; then sed_command='gsed'; fi

cp -r ../imperial-calculator/* assets/www
$sed_command -i '/<\/body>/i<script src="phonegap.js"><\/script><script src="share.js"><\/script>' assets/www/index.html
rm -fr assets/www/gimp/

if [[ $skip_install_entirely ]]; then
	exit 0;
fi;

if [[ $uninstall_first ]]; then
	adb uninstall com.nolanlawson.imperial.android
fi
ant clean debug install
adb shell am start -a android.intent.action.MAIN -n com.nolanlawson.imperial.android/.MainActivity

rm -fr `echo assets/www/* | tr ' ' '\n' | grep -v phonegap.js | grep -v share.js`

