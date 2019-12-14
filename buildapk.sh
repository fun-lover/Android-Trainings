#!/bin/sh


SDK="${HOME}/android-sdk-linux"
BUILD_TOOLS="${SDK}/build-tools/21.0.1"
PLATFORM="${SDK}/platforms/android-16"
PROG_FOLDER_NAME="$1"
PKG_NAME="$2"
MAIN_ACT_NAME="$3"
APK_NAME="$4"
PKG_PATH="$5"

echo "Locational variables made successfully..."


cd "/home/pro/PROGRAMMING-PROJECTS/Android-Workspace/${PROG_FOLDER_NAME}"
mkdir -p build/gen build/obj build/apk




"${BUILD_TOOLS}/aapt" package -f -m -J build/gen/ -S res -M AndroidManifest.xml -I "${PLATFORM}/android.jar"

echo "R.java file created successfully..."

#############################
javac -source 1.7 -target 1.7 -bootclasspath "${JAVA_HOME}/jre/lib/rt.jar" -classpath "${PLATFORM}/android.jar" -d "build/obj build/gen/${PKG_PATH}/R.java" "java/${PKG_PATH}/$2"

echo "Compile done successfully..."

"${BUILD_TOOLS}/dx" --dex --output=build/apk/classes.dex build/obj/

echo "Converted to Dalvik code successfully..."

"${BUILD_TOOLS}/aapt" package -f -M AndroidManifest.xml -S res/ -I "${PLATFORM}/android.jar" -F "build/${APK_NAME}.unsigned.apk" build/apk/

echo "Contents packeged successfully..."

"${BUILD_TOOLS}/zipalign" -f 4 "build/${APK_NAME}.unsigned.apk" "build/${APK_NAME}.aligned.apk"




keytool -genkeypair -keystore keystore.jks -alias androidkey -validity 10000 -keyalg RSA -keysize 2048 -storepass android -keypass android

echo "Key store and key created successfully..."





"apksigner" sign --ks keystore.jks --ks-key-alias androidkey --ks-pass pass:android --key-pass pass:android --out "build/${APK_NAME}.apk" "build/${APK_NAME}.aligned.apk"

echo "sign done successfully..."



echo "connect your device..."

"${SDK}/platform-tools/adb" install -r "build/${APK_NAME}.apk"

echo "Installation done successfully..."



# Run on device
echo "last echo.... ${PKG_NAME}/.${MAIN_ACT_NAME}"

#"${SDK}/platform-tools/adb" shell am start -n "${PKG_NAME}/.${MAIN_ACT_NAME}"

"${SDK}/platform-tools/adb" shell am start -n com.angel.mymessanger/.CreateMessageActivity
