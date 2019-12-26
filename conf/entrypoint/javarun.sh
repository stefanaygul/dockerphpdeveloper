java -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/home/logs/ -Xmx$AAS_HEAP -XX:ErrorFile=/home/logs/hs_err_pid_%p.log -XX:+CrashOnOutOfMemoryError -XX:+UseGCLogFileRotation -XX:GCLogFileSize=10M -XX:NumberOfGCLogFiles=5 -Xloggc:/home/logs/gc.log -verbose:gc -Dfeatures.file=/home/conf/acapi/features.json -Djava.security.egd=file:///dev/urandom -jar /home/bin/aas/airties-cloud-aas-3.1.17.jar --spring.config.location=file:/home/conf/aas/application.properties
