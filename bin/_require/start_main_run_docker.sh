run_command="docker run -p 8080:8080 -p 8000:8000 -d \
	-v /$TMP_FOLDER/logs:/usr/local/tomcat/logs \
	-v /$TMP_FOLDER/deployable:/usr/local/tomcat/webapps \
	$IMAGE_NAME"
echo $run_command
eval $run_command > $TMP_FOLDER/docker.pid