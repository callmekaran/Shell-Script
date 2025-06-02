##########################################################################
#Get the username of the logged-in user
USER_NAME=$(whoami)
# Get the IP or terminal
LOGIN_INFO=$(who -m | awk '{print $5}')
# Get the date/time
DATE_TIME=$(date)

# Prepare email body
EMAIL_BODY="User: $USER_NAME
Login info: $LOGIN_INFO
Date/Time: $DATE_TIME
Host: $(hostname)"

echo "$EMAIL_BODY" | mutt -s "Login Alert on $(hostname)" youremail.com


#########################################################################

sudo apt update -y && sudo apt install mutt -y 

nano ~/.muttrc

set from = "your_email@gmail.com"
set realname = "Your Name"
set smtp_url = "smtps://your_email@gmail.com@smtp.gmail.com:465/"
set smtp_pass = "your_app_password"
set ssl_starttls = yes
set ssl_force_tls = yes

########################################################################


Verify Script by mannually run then copy to /etc/profile.d #it runs on every login shell.


