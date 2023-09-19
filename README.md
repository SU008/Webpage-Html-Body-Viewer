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


Home Page of the App:
![image](https://github.com/SU008/Webpage-Html-Body-Viewer/assets/91423397/ee47dcfd-7ef6-460a-89ad-4d2bfe0bde16)

Html Viewer page:
![image](https://github.com/SU008/Webpage-Html-Body-Viewer/assets/91423397/911f99ae-78ad-4a18-a06e-ac7f7dc4ed89)




