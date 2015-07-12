#! /bin/bash
#################################################
###  Create date:Sat Jul 11 08:42:09 PDT 2015 ###
#################################################
######### Created by: Marlon Balandra ###########
######### email: mbalandra@gmail.com ############
#################################################
############## script definition ################
## This script will set my home PATH to this   ## 
##        PATH=/home/$USER/bin		       ##
#################################################
##############  set variables   #################
var1="$(echo $USER)"
var2=$PATH
#################################################
###  THIS SCRIPT HAS BEEN TESTED & APPROVED   ### 
#################################################
#############  START OF SCRIPT  #################
#################################################
#
echo " What is your userid? "
read userid
if [[ $userid = $var1 ]]
   then
	    echo " If you are not $USER please EXIT this script NOW!!! - Otherwise it will continue " 
   else
	    echo " I will not edit a userdid's that isnt yours and/or if your logged in as ROOT! - Please logout of ROOT and login to your local account!!! exiting NOW..."; exit 1 

fi
#
echo " PATH = $var2:/home/$USER/bin " >> ~/.bashrc
#
sleep 1
#
echo "export PATH;" >> ~/.bashrc
#
sleep 2
#
echo " sourcing out .bashrc - this will take a second or two "
echo `source .bashrc`
#
sleep 3
#
echo " Updated .bashrc with your new PATH and sourced .bashrc " 
#
sleep 3
#
echo " COMPLETED !!! Did you want to view the updated file? type (Y) or (N) "
read file 
if [[ $file = Y ]] 
   then
	    echo `cat ~/.bashrc`
   else
	    echo " You didnt type " Y " so GOODBYE "; exit 0

fi
