echo "Starting the container"

IMAGE_ID=$(docker images | grep $IMAGE_NAME | awk "{print $3;}")

if [ -n "$IMAGE_ID" ]; then

	echo "1) Creating TMP_FOLDER and its sub folders"
	. bin/_require/start_main_tmp_folder.sh

	# MAIN TASKS
	echo "2) Copying the war file"
	. bin/_require/start_main_cp_war_file.sh

	echo "3) Running docker container"
	. bin/_require/start_main_run_docker.sh

	echo "Finished starting the container"
	echo "Now you can access the app from http://localhost:8080/app"
else
	echo "You seem to have not built the container yet"
	echo "Please run bin/build.sh before proceeding"
fi