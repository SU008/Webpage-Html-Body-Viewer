# Webpage-Html-Body-Viewer
This is only an Andriod apk file which can be downloaded and installed for Andriod Devices. 

On Andriod download the 'app-release.zip', unzip the file and install the .apk on your andriod device
'Webpage-Html-Body.zip' is the full zipped project files


Go to andriod>app>build.gradle and set:
android {
    
    compileSdkVersion 33
    .....
}
and set:
defaultConfig {
        minSdkVersion 33
}

In the Andriod Manifey.xml file add internet permissions for andriod:
<uses-permission android:name="android.permission.INTERNET" />



![image](https://github.com/SU008/Webpage-Html-Body-Viewer/assets/91423397/b5d3a9cf-6642-4106-a7b8-713b6598dfcd)



