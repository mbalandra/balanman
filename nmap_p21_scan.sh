#! /bin/bash
##################################################################################
### Created on Fri Jul 10 19:27:52 PDT 2015  #####################################
##################################################################################
##################################################################################
###  This script will run a network scan on all connected hosts in the following #
###  private C class network(ex:192.168.1.0/24). Scanning for port 21 only, then # 
###  putting the results into a file called FTP1_scan_results.txt	         #
##################################################################################
###  Author: Marlon Balandra 							 #	
###  Title: Senior Systems Engineer						 #
##################################################################################
### SET VARIABLES HERE ###########################################################
var="$(ls -la /home/marlonb/tmp/ftp1|awk '{print$5}')"
var1="$(date)"
##################################################################################
### BEGINING OF SCRIPT ###########################################################
##################################################################################
#
#nmap -sT 192.168.1.0/24 -p 21 -oG /home/marlonb/output_bash/nmap_scan_all.txt
nmap -sT 192.168.1.0/24 -p 21 >> /home/marlonb/output_bash/nmap_scan_all.txt
#
cat /home/marlonb/output_bash/nmap_scan_all.txt | grep open >> /home/marlonb/tmp/ftp1
#
####
#
if [ $var -eq 0 ] && [ $(ls -la /home/marlonb/tmp/ftp1|awk '{print$5}') -eq 0 ] 
   then
	echo " Network is secure!  I didnt detect any OPEN PORTS on PORT 21 Today $var1 " 
   else
	echo " I have detected at least 1 system with port 21 open, and possibly many more. Please wait while I scan all 255 IP's. A l
ist of the hosts or devices will be placed in a file named nmap_scan_all.txt "

fi
#
###
#
sleep 1
#
cat /home/marlonb/tmp/ftp1 | cut -f2 -d":" | cut -f1 -d"(" >> /home/marlonb/output_bash/nmap_p21_report.txt 
#
sleep 1
#
###
#
for name in "$(cat /home/marlonb/output_bash/nmap_p21_report.txt)";
	do
        	nmap -sV -p 21 $name >> /home/marlonb/output_bash/hosts_nmap_p21_scan.txt
done
#
###
#
############## END OF SCRIPT ################
