#!/bin/bash

sed_command='sed'

if [ $(uname) == 'Darwin' ]; then sed_command='gsed'; fi

cp -r ../imperial-calculator/* assets/www
$sed_command -i '/<\/body>/i<script src="phonegap.js"><\/script><script src="share.js"><\/script>' assets/www/index.html


#adb uninstall com.nolanlawson.imperial.android
ant clean debug install
adb shell am start -a android.intent.action.MAIN -n com.nolanlawson.imperial.android/.MainActivity

rm -fr `echo assets/www/* | tr ' ' '\n' | grep -v phonegap.js | grep -v share.js`

