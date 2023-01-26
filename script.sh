#!/bin/bash

_URL="http://localhost/nagios/cgi-bin/showlog.cgi?archive=1"     ## Use your nagios report links from browser
_USER=nagios_username         ## Change the username as per your nagios user
_PASSWORD=Your_Nagios_password     ## Change the password as per your nagios user
_REPORT_PATH=/opt/NagiosReport     ## create or use the same directory as per your requirement
_FILE_NAME=Nagios-EventLog-`date +%F --date="yesterday"`.pdf  ## You can also change the date format to current date as "today", if you change here please remember to change in the last section of the script as well. 
_TO_EMAIL=your@email.com       ## Change the email, where you want to get the report
_WKHTMLTOPDF=`which wkhtmltopdf`

if [ -d $_REPORT_PATH ]
then
echo "NagiosReport directory already exist in /opt "
else
mkdir -p $_REPORT_PATH
echo $(ls -ld $_REPORT_PATH)
echo "$_REPORT_PATH directory created"
fi

### Create pdf file of Nagios Event Log
$_WKHTMLTOPDF --username $_USER --password $_PASSWORD "$_URL" "$_REPORT_PATH/$_FILE_NAME"

### Send Email with attachment
echo -e "Hello Team,\nFind Nagios report dated of $(date +%F --date=yesterday), attachment is enclosed in this email\nBest Regards,\nNagios Admin"|mutt -a "$_REPORT_PATH/$_FILE_NAME" -s "Report: Nagios Event Log  $(date +%F --date=yesterday)" -- $_TO_EMAIL
