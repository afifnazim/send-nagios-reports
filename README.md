# send-nagios-reports
<b><i>Nagios report automated.</i></b>

To send automated nagios report, we can use the <b><i>wkhtmltopdf</i></b> package and <b><i>crontab</i></b> to schedule it in our linux machines. 

We can install the package from this link - https://wkhtmltopdf.org/downloads.html based on our OS system. We may also need to install <b><i>mutt</i></b> package to send emails from linux machines using attachements. 

Once we have installed the wkhtmltopdf, we can create the script to automate reports and make a pdf file from nagios html page.

To install wkhtmltopdf we can use <br> 
```yum localinstall -y wkhtmltopdf```

Separate files have been created for bash script and CentOS 7 commands. 
