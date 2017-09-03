set JAVA_HOME=C:\Program Files (x86)\Java\jdk1.8.0_102
path %JAVA_HOME%\bin;%path%
cd F:\LAMW\Projects\BassStreamPlayback
jarsigner -verify -verbose -certs F:\LAMW\Projects\BassStreamPlayback\bin\BassStreamPlayback-release.apk
