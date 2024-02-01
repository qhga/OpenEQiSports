# Build via Docker and extract APK

docker build . -t eqipoc-builder
docker run --name eqipoc eqipoc-builder
docker cp eqipoc:/app/bin/Debug/net7.0-android/com.hughesjs.eqipoc-Signed.apk .

adb install /.../com.hughesjs.eqipoc-Signed.apk