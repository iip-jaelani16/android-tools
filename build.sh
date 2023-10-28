#!/bin/bash

# Jalankan apktool untuk mendekompilasi APK
apktool b base

# Tanda tangan APK yang telah dibuat kembali dengan uber-apk-signer
java -jar uber-apk-signer-1.3.0.jar -a ./base/dist/base.apk

# Uninstall aplikasi dengan package name "id.dana"
adb uninstall id.dana

# Install APK yang telah ditanda tangani ulang
adb install -r ./base/dist/base-aligned-debugSigned.apk
