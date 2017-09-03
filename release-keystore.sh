export JAVA_HOME=/Program Files (x86)/Java/jdk1.8.0_102
cd /LAMW/Projects/BassStreamPlayback
keytool -genkey -v -keystore BassStreamPlayback-release.keystore -alias bassstreamplaybackaliaskey -keyalg RSA -keysize 2048 -validity 10000 < /LAMW/Projects/BassStreamPlayback/bassstreamplaybackkeytool_input.txt
