#!/bin/sh
export IMAGE_NAME=test/test

export WAR_FILE=/D/folder/to/your/app/app.war
#export WAR_FILE=http://your_maven_repository/groupId/version/yourApp.war

# There is a bug in Mingw with respects to file path resolution and
# another bug related to permissions with VirtualBox.
# The temporary folder has to be somewhere under $HOME
export TMP_FOLDER=$HOME/.tmp