set JAVA_HOME=C:\Program Files (x86)\Java\jdk1.8.0_102
set PATH=%JAVA_HOME%\bin;%PATH%
set JAVA_TOOL_OPTIONS=-Duser.language=en
cd F:\LAMW\Projects\BassStreamPlayback
keytool -genkey -v -keystore BassStreamPlayback-release.keystore -alias bassstreamplaybackaliaskey -keyalg RSA -keysize 2048 -validity 10000 < F:\LAMW\Projects\BassStreamPlayback\keytool_input.txt
