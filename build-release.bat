set Path=%PATH%;F:\LAMW\apache-ant-1.9.7\bin
set JAVA_HOME=C:\Program Files (x86)\Java\jdk1.8.0_102
cd F:\LAMW\Projects\BassStreamPlayback
call ant clean release
if errorlevel 1 pause
