# No-Ads-Me
Script that downloads host filters, configures them and attaches them to the host file, to avoid ads, pop ups and malicious redirects, on the internet
as it also updates the filters, all this does it in automatic, this script uses wget and unzip, if you do not have them installed, you can install them like this:

In your terminal type this:

sudo apt install wget

This script downloads the filters from three sources:
http://www.montanamenagerie.org/hostsfile/hosts.zip
http://winhelp2002.mvps.org/hosts.txt
http://someonewhocares.org/hosts/hosts

The total filters are about 620000.

To use this script you execute it from the terminal and select an option:

Update-hostsfile 
Backup-hostsfile 
Restore-original-hostsfile
Restore-new-hostsfile 
Exit
