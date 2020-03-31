#/bin/bash

PROFILE_PATH="/app/aws_profile"

if [ ! -f $PROFILE_PATH ]; then
	echo $PROFILE_PATH not exists
	exit
fi

AWS_ACCESS_KEY=$(awk -F "=" '/aws_access_key_id/ {print $2}' $PROFILE_PATH)
AWS_SECRET_KEY=$(awk -F "=" '/aws_secret_access_key/ {print $2}' $PROFILE_PATH)
if [ -z "$AWS_ACCESS_KEY" ]
then
	echo AWS_ACCESS_KEY does not find
	exit
fi

if [ -z "$AWS_SECRET_KEY" ]
then
	echo AWS_SECRET_KEY does not find
	exit
fi

mkdir -p ~/.aws

echo -e "[default]\naws_access_key_id=$AWS_ACCESS_KEY\naws_secret_access_key=$AWS_SECRET_KEY" > ~/.aws/config
cat $PROFILE_PATH > ~/.aws/config

EB_COMMAND="eb $*"
echo $EB_COMMAND
$EB_COMMAND
