#!/bin/bash
set -e
set -x

cmake -Sios_x86_64 -G Xcode ./ios_x86_64 -B bin/ios_x86_64 -DPLATFORM=SIMULATOR64  -DDEPLOYMENT_TARGET=15.0 -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake
cmake --build ./bin/ios_x86_64
cmake -Sios_simulator_arm64 -G Xcode ./ios_simulator_arm64 -B bin/ios_simulator_arm64 -DPLATFORM=SIMULATORARM64  -DDEPLOYMENT_TARGET=15.0 -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake
cmake --build ./bin/ios_simulator_arm64
cmake -Sios_arm64 -G Xcode ./ios_arm64 -B bin/ios_arm64 -DPLATFORM=OS64  -DDEPLOYMENT_TARGET=15.0 -DCMAKE_TOOLCHAIN_FILE=ios.toolchain.cmake
cmake --build ./bin/ios_arm64
mkdir -p bin/lipo
lipo -create bin/ios_simulator_arm64/Debug-iphonesimulator/libyaneuraou.a bin/ios_x86_64/Debug-iphonesimulator/libyaneuraou.a -output bin/lipo/libyaneuraou.a
rm -r ../Frameworks/libyaneuraou.xcframework || true
xcodebuild -create-xcframework \
    -library bin/ios_arm64/Debug-iphoneos/libyaneuraou.a -headers ./include \
    -library bin/lipo/libyaneuraou.a -headers ./include \
    -output ../Frameworks/libyaneuraou.xcframework
