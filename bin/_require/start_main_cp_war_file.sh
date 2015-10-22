if [[ $WAR_FILE =~ ^http ]]; then
	echo "Copy war file from repository"
	curl -o $TMP_FOLDER/deployable/app.war $WAR_FILE
else
	echo "Copying war file from local system"
	deploy_command="cp $WAR_FILE $TMP_FOLDER/deployable/app.war"
	echo $deploy_command
	eval $deploy_command
fi