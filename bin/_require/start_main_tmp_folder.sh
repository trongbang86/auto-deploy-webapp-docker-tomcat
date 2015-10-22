
# CREATING FOLDERS
if [ ! -d "$TMP_FOLDER" ]; then
	mkdir $TMP_FOLDER
fi

if [ ! -d "$TMP_FOLDER/logs" ]; then
	mkdir $TMP_FOLDER/logs
fi

if [ ! -d "$TMP_FOLDER/deployable" ]; then
	mkdir $TMP_FOLDER/deployable
fi