Getting set up:

Currently, all of the files in the repo are non-relative links, so you'll have to change any/all of them to whatever your setup is.

$ cd megareg-script/
$nano .account

.account:
<--->
EMAILDOMAIN="testing.com"
PASSWORD="p@ssw0rd!"
<--->


$ nano megarc/storageTest

Add the email domain and password as inputted in .account


Set up a mail server on your server for full automation


Use `registerloop.sh` to loop through a ton of accounts like this:

`$ ./registerloop.sh 1 100`

That will create 100 accounts.

