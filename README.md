# send-nagios-reports
<b><i>Nagios report automated.</i></b>

To send automated nagios report, we can use the <b><i>wkhtmltopdf</i></b> package and <b><i>crontab</i></b> to schedule it in our linux machines. 

We can install the package from this link - https://wkhtmltopdf.org/downloads.html based on our OS system. We may also need to install <b><i>mutt</i></b> package to send emails from linux machines using attachements. 

Once we have installed the wkhtmltopdf, we can create the script to automate reports and make a pdf file from nagios html page.

We can use the below command to download the wkhtmltopdf package and then install it -
```shell
wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6-1/wkhtmltox-0.12.6-1.centos7.x86_64.rpm 

yum localinstall -y wkhtmltox-0.12.6-1.centos7.x86_64.rpm
```

To be able to attach files in the mail notification we have to install mutt package - 
```shell
yum install -y mutt
```

We need to provide correct permission to the script file and to run the file- 
```shell
chmod 700 script.sh ## File given in the repository, rename it as neccessary while using in your emvironment

/usr/bin/sh script.sh
```

 ## Issues found
 
 There might be an BAD IDN error in the DNS while sending mail notification, the work around is given below -
 
 We need to create/edit muttrc file and below line - 
 ```shell
 vi ~/.muttrc
 
 set from="something@something.com"
 ```
 
 ## Scheduling it using crontab
 
 Now we can schedule the script in crontab to send mail notifications automatically -
 ```shell
 crontab -e
 
 00 08 * * 1 /usr/bin/sh script.sh ## This will send email notification at 8 AM every Monday 
 ```
