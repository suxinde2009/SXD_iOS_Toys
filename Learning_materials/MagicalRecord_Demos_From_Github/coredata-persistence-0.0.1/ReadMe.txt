To build a combined library for use in both the sim and on device, build both individual libraries, then cd to the build directory in terminal and execute the following:

lipo -create Release-iphoneos/libPersistence.a Debug-iphonesimulator/libPersistence.a -output libPersistence.a
