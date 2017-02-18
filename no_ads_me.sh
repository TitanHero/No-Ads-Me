#!/bin/bash

#    Script made by TitanHero /\ Script hecho por TitanHero

if ! test -a ~/.hostsbackup/hostsoriginal/hosts; then
	mkdir ~/.hostsbackup ~/.hostsbackup/hostsdownload ~/.hostsbackup/hostsclean ~/.hostsbackup/hostsoriginal ~/.hostsbackup/hostsnewbackup;cp /etc/hosts ~/.hostsbackup/hostsoriginal/; [ $? -ne 0 ] && echo "Sorry something is wrong can't make backup of your hosts file"
fi

clear
echo """$(tput setaf 2)
                       ▗▖ ▖         ▗▖   ▐         ▗  ▖    
                       ▐▚ ▌ ▄▖      ▐▌  ▄▟  ▄▖     ▐▌▐▌ ▄▖ 
                       ▐▐▖▌▐▘▜      ▌▐ ▐▘▜ ▐ ▝     ▐▐▌▌▐▘▐ 
                       ▐ ▌▌▐ ▐      ▙▟ ▐ ▐  ▀▚     ▐▝▘▌▐▀▀ 
                       ▐ ▐▌▝▙▛     ▐  ▌▝▙█ ▝▄▞     ▐  ▌▝▙▞ 
                                                           
                               ▀▀▀             ▀▀▀        
 $(tput sgr 0)"""
echo " $(tput setaf 7)           Script made by TitanHero /\ Script hecho por TitanHero$(tput sgr 0)"
echo  " $(tput setaf 7)             Visit my github:  https://github.com/TitanHero$(tput sgr 0)"
echo ""
echo "$(tput setaf 3)     The folder where are the script files (host files), is in the path : 
                         $HOME/.hostsbackup/$(tput sgr 0)"
echo -e "\n"
echo "$(tput setaf 1)       This script needs$(tput setaf 6) Super User permissions$(tput sgr 0)$(tput setaf 1), for modify the hosts files.$(tput sgr 0)"
echo -e "\n"
	
selection="Update-hostsfile Backup-hostsfile Restore-original-hostsfile Restore-new-hostsfile Exit"

PS3="Select an option (Insert the option number) : "

select opt in $selection; do
	if [ "$opt" = "Update-hostsfile" ]; then
		echo ""
		wget -P ~/.hostsbackup/hostsdownload/ -U "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) Gecko/20100101 Firefox/37.0" http://someonewhocares.org/hosts/hosts; sleep 2
		wget -P ~/.hostsbackup/hostsdownload/ -U "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) Gecko/20100101 Firefox/37.0" http://winhelp2002.mvps.org/hosts.txt ; sleep 2
		echo """$(tput setaf 6)
		▞▀▖▜          ▗        ▌        ▐      ▗▀▖▗▜       
		▌  ▐ ▞▀▖▝▀▖▛▀▖▄ ▛▀▖▞▀▌ ▛▀▖▞▀▖▞▀▘▜▀ ▞▀▘ ▐  ▄▐ ▞▀▖▞▀▘
		▌ ▖▐ ▛▀ ▞▀▌▌ ▌▐ ▌ ▌▚▄▌ ▌ ▌▌ ▌▝▀▖▐ ▖▝▀▖ ▜▀ ▐▐ ▛▀ ▝▀▖
		▝▀  ▘▝▀▘▝▀▘▘ ▘▀▘▘ ▘▗▄▘ ▘ ▘▝▀ ▀▀  ▀ ▀▀  ▐  ▀▘▘▝▀▘▀▀ 
$(tput sgr 0)"""
		echo "                          Wait a minute or less"

		cicle=$(ls ~/.hostsbackup/hostsdownload/)
		for arch in $cicle
		do
			sed -i '/localhost/d' ~/.hostsbackup/hostsdownload/$arch && sed -i '/local/d' ~/.hostsbackup/hostsdownload/$arch && sed -i '/broadcasthost/d' ~/.hostsbackup/hostsdownload/$arch && sed -i 's/0.0.0.0/127.0.0.1/g' ~/.hostsbackup/hostsdownload/$arch && mv ~/.hostsbackup/hostsdownload/$arch ~/.hostsbackup/hostsclean/$arch
		done
		wget -P ~/.hostsbackup/hostsdownload/ -U "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) Gecko/20100101 Firefox/37.0" http://www.montanamenagerie.org/hostsfile/hosts.zip; sleep 3
		cicles=$(ls ~/.hostsbackup/hostsdownload/)
		unzip  ~/.hostsbackup/hostsdownload/$cicles -d ~/.hostsbackup/hostsdownload/
		echo """$(tput setaf 4)	
		▞▀▖▜          ▗        ▌        ▐      ▗▀▖▗▜       
		▌  ▐ ▞▀▖▝▀▖▛▀▖▄ ▛▀▖▞▀▌ ▛▀▖▞▀▖▞▀▘▜▀ ▞▀▘ ▐  ▄▐ ▞▀▖▞▀▘
		▌ ▖▐ ▛▀ ▞▀▌▌ ▌▐ ▌ ▌▚▄▌ ▌ ▌▌ ▌▝▀▖▐ ▖▝▀▖ ▜▀ ▐▐ ▛▀ ▝▀▖
		▝▀  ▘▝▀▘▝▀▘▘ ▘▀▘▘ ▘▗▄▘ ▘ ▘▝▀ ▀▀  ▀ ▀▀  ▐  ▀▘▘▝▀▘▀▀ 
$(tput sgr 0)"""
		echo "                          Wait a minute or less"
		cicle=$(ls ~/.hostsbackup/hostsdownload/)
		for arch in $cicle
		do
			echo $arch
			if test $arch != 'hosts.txt' ;then
				rm ~/.hostsbackup/hostsdownload/$arch
			fi
		done
		cicle=$(ls ~/.hostsbackup/hostsdownload/)
		sed -i '/IPv4/d' ~/.hostsbackup/hostsdownload/$cicle; sed -i '/IPv6/d' ~/.hostsbackup/hostsdownload/$cicle; mv ~/.hostsbackup/hostsdownload/$cicle ~/.hostsbackup/hostsclean/hosttwo.txt 
		sudo cat ~/.hostsbackup/hostsoriginal/hosts ~/.hostsbackup/hostsclean/hosts  ~/.hostsbackup/hostsclean/hosts.txt ~/.hostsbackup/hostsdownload/hosttwo.txt > ~/.hostsbackup/hosts 
		echo """$(tput setaf 1)
		              ⣏⡱ ⢀⡀ ⢀⣀ ⢀⣸ ⡀⢀
		              ⠇⠱ ⠣⠭ ⠣⠼ ⠣⠼ ⣑⡺
		$(tput sgr 0)"""
		echo "		1) Update-hostsfile	       4) Restore-hostsfile-new"
		echo "		2) Backup-hostsfile	       5) Exit"
		echo "		3) Restore-hostsfile-original"
		echo ""

	elif [ "$opt" = "Backup-hostsfile" ]; then
		cp /etc/hosts ~/.hostsbackup/hostsnewbackup/hosts
		echo """$(tput setaf 1)
		              ⣏⡱ ⢀⡀ ⢀⣀ ⢀⣸ ⡀⢀
		              ⠇⠱ ⠣⠭ ⠣⠼ ⠣⠼ ⣑⡺
		$(tput sgr 0)"""
		echo "		1) Update-hostsfile	       4) Restore-hostsfile-new"
		echo "		2) Backup-hostsfile	       5) Exit"
		echo "		3) Restore-hostsfile-original"
		echo ""
	elif [ "$opt" = "Restore-original-hostsfile" ]; then
		sudo cp ~/.hostsbackup/hostsoriginal/hosts /etc/hosts
		echo """$(tput setaf 1)
		              ⣏⡱ ⢀⡀ ⢀⣀ ⢀⣸ ⡀⢀
		              ⠇⠱ ⠣⠭ ⠣⠼ ⠣⠼ ⣑⡺
		$(tput sgr 0)"""
		echo "		1) Update-hostsfile	       4) Restore-hostsfile-new"
		echo "		2) Backup-hostsfile	       5) Exit"
		echo "		3) Restore-hostsfile-original"
		echo ""
	elif [ "$opt" = "Restore-new-hostsfile" ]; then
		 sudo cp ~/.hostsbackup/hostsnewbackup/hosts /etc/hosts
		echo """$(tput setaf 1)
		              ⣏⡱ ⢀⡀ ⢀⣀ ⢀⣸ ⡀⢀
		              ⠇⠱ ⠣⠭ ⠣⠼ ⠣⠼ ⣑⡺
		$(tput sgr 0)"""
		echo "		1) Update-hostsfile	       4) Restore-hostsfile-new"
		echo "		2) Backup-hostsfile	       5) Exit"
		echo "		3) Restore-hostsfile-original"
		echo ""
	else [ "$opt" = "Exit" ]
		echo """





		"""
		exit
	fi 
done
