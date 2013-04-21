package com.nolanlawson.imperial.android;

import org.apache.cordova.DroidGap;

import android.os.Bundle;

public class MainActivity extends DroidGap {

    private static final int SPLASH_DISPLAY_TIME = 5000;
   
    
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        // Config properties in addition to res/xml/config.xml.  See:
        // https://github.com/apache/incubator-cordova-android/blob/master/framework/src/org/apache/cordova/DroidGap.java
        super.setIntegerProperty("backgroundColor", R.color.splash_bg);
        super.setIntegerProperty("loadUrlTimeoutValue", 120000);
        
        setContentView(R.layout.activity_main);
        
        
        if (getIntent() != null && getIntent().getData() != null 
        		&& getIntent().getData().getPath() != null
        		&& getIntent().getData().getPath().equals("/imperial-calculator/")
        		&& getIntent().getData().getEncodedFragment() != null) {
        	// handle "share" URL
        	
        	String fragment = getIntent().getData().getEncodedFragment();
        	loadUrl("file:///android_asset/www/index.html#" + fragment, SPLASH_DISPLAY_TIME);
        	
        } else {
        	loadUrl("file:///android_asset/www/index.html", SPLASH_DISPLAY_TIME);
        }

    }    
}
