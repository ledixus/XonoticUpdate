##Xonotic and Modpack update script
  
#####System requirements: mutt
#####For the mail report you need a configured mail server (a sendonly mail server is enough).  

After download make the script executable, change "YOUREMAIL to your Email adress  
and change the paths to your local config.

Add this line via crontab -e:

	0 7 * * 1,3,5 /path/to/the/script

It will update the Xonotic server at 7am on Monday, Wednesday and Friday.  
The Modpack will update only on friday's.

Logfiles will be deleted after 14 days.


