<?php

$mailbox = "/var/mail/user";
$findString = "https://mega.nz/#confirm";

$linkPos = strpos(file_get_contents($mailbox),$findString);
if($linkPos == False){echo 0;}
else {
	$endlinePos = strpos(file_get_contents($mailbox),"\n",$linkPos);
	$link = substr(file_get_contents($mailbox),$linkPos,$endlinePos-$linkPos);
	echo $link;
	$filename = "/home/user/megarc/links";

	//DATE=`date +%Y-%m-%d.%H:%M:%S`;

	file_put_contents($filename,$link . " <<>> $argv[1]\n", FILE_APPEND);
	exec("cp /var/mail/user /home/user/Mbox/mbox`date +%Y-%m-%d.%H:%M:%S`");
	//exec(" > /var/mail/user");
}
?>
