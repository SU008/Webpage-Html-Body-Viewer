# Webpage-Html-Body-Viewer
This is only an Andriod apk file which can be downloaded and installed for Andriod Devices. 

On Andriod download the app-release.zip, unzip the file and install the .apk on your andriod device


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


