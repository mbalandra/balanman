#! /bin/bash
#########################################################################################
################ created on Fri Jul 10 19:27:52 PDT 2015 ##############################
#####################################################################################
### This script will run a network scan on all connected hosts in the following ###
## private C class network(ex:192.168.1.0/24). Scanning for port 21 only, then #
## putting the results into a file called FTP1_scan_results.txt ##############
############################################################################
### Author: Marlon Balandra ##############################################
### Title: Senior Systems Engineer #####################################
######################################################################
### SET VARIABLES HERE #############################################
var=$(ls -la /home/marlonb/tmp/ftp1|awk '{print$5}')
################################################################
### Beggining of Script ######################################
############################################################
nmap -sT 192.168.1.0/24 -p 21 -oG /home/marlonb/output_bash/nmap_scan_all.txt
cat /home/marlonb/output_bash/nmap_scan_all.txt | grep open >> /home/marlonb/tmp/ftp1
#
if [[$var1=0]]
   then
	echo " ALL HOSTS DO NOT HAVE PORT21 OPEN - this network is secure....GOOD JOB ENGINEER !!!"
   else
	echo " You currently have systems with port21 open on them.  Please wait while I calculate a list of the hosts or devices with this vulnerablilty!! you should be ashamed !!!bad engineer!!"
fi
#
sleep 2
#
cat /home/marlonb/tmp/ftp1 | cut -f2 -d":" | cut -f1 -d"(" > /home/marlonb/output_bash/nmap_p21_report.txt 
#
sleep 3
#
for name in $(cat /home/marlonb/output_bash/nmap_p21_report.txt);
	do
		nmap -sV -p 21 $name
done
