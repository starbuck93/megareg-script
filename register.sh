#!/bin/bash
if [ $# -ne 1 ]; then
    echo "$0": usage: ./register.sh 1
    exit 1
fi

source .account

echo "Registering storage$1@$EMAILDOMAIN"
CONFIRM="$(megareg --scripted --register --email storage"$1"@$EMAILDOMAIN --name user name --password $PASSWORD)"
#echo "megareg run"
echo "$CONFIRM" >> megarc/links
cp megarc/storageTest megarc/storage"$1"
sed -i "s/TEST/$1/g" megarc/storage"$1"
sleep 1
LINK="$(php getLink.php $1)"
while [ "$LINK" = "0" ]
do
	echo "Not yet"
	sleep 1
	LINK="$(php getLink.php)"
	echo ">$LINK<"
done

link3=${CONFIRM/@LINK@/\'"$LINK"\'}
eval $link3
#echo "<< Welcome email"
echo $link3 >> megarc/links
#echo "Press enter to clear the mailbox or CTRL+C to stop"
#read asdf
sleep 1
#echo "truncating..."
truncate -s 0 /var/mail/user
sleep 1
echo "   > Registered $1..."
