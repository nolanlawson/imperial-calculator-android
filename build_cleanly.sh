#!/bin/bash

sed_command='sed'

if [ $(uname) == 'Darwin' ]; then sed_command='gsed'; fi

cp -r ../imperial-calculator/* assets/www
$sed_command -i '/<\/body>/i<script src="phonegap.js"><\/script>' assets/www/index.html
ant clean debug install
rm -fr `echo assets/www/* | tr ' ' '\n' | grep -v phonegap.js`
