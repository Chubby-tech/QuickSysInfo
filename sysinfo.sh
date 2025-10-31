#!/bin/bash

echo " THIS IS A MY FIRST PROJECT ON BASH SCRIPT"
echo " This project is used to view any system info"

system_display(){

local display=("1. View System Info" "2. View CPU Info" "3. View Memmory Info" "4. View Disk Usage" "5. View Network Info" "6. View System Summary" "7. Exit")
for i in "${display[@]}"
do
    echo $i
done

while true; do
read -p "Pick a number that you wish to display: " num_dis

if [[ ! "$num_dis" =~ ^[0-7]+$ ]]
then
    echo "ERROR"
    sleep 0.2
    echo " Please input a number for what you want to display"
else
    if [[ $num_dis == 7 ]]
    then
        echo " GoodBye"
        break
    else

    read -p "Do you want it to be a text format (y/n): " text_format
    if [[ $text_format == "y" ]]
    then
        echo " Ready....... "
        sleep 0.5
        display_format "$num_dis"
    else
        echo " Ready........"
        sleep 0.5
        echo " Printing out file"
        sleep 0.2
        display_format_2 "$num_dis"
    fi
    break
    fi
fi
done

}

display_format(){

    case $1 in
        1)
            sys_info >> ~/Desktop/sysinfo.txt  
        echo " File has been saved and sent to Desktop";;
        2)
            cpu_info >> ~/Desktop/cpuinfo.txt
        echo " File has been saved and sent to Desktop";;
        3)
            mem_info >> ~/Desktop/meminfo.txt
        echo " File has been saved and sent to Desktop";;
        4)
            disk_info >> ~/Desktop/diskinfo.txt
        echo " File has been saved and sent to Desktop";;
        5)
            network_info >> ~/Desktop/netinfo.txt
        echo " File has been saved and sent to Desktop";;
        6)
            sys_sum >> ~/Desktop/summaryinfo.txt
        echo " File has been saved and sent to Desktop";;
    esac

}
sys_info(){
        echo " This is the full System Info"
        echo " Hostname: $(hostname)"
       echo " Operating System: $(lsb_release - a)"
        echo "Kernal Version: $(uname -a)"
        echo " System Uptime: $(uptime -p)"
        echo " Current User: $(whoami)"

}
cpu_info(){
         echo " This is the CPU Info"
         echo " CPU Info: $(lscpu)"
     }
mem_info(){

echo " This is the Memory Info"
echo "Ram Usage: $(free -h)"
}


disk_info(){
    echo "This is the Disk Info"
    echo " Disk Usage $(df -h)"
}

network_info(){
    echo "This is the Network Info"
    echo "IPV4 Address: $(ip -4 address)"
    echo "IP SUMMARY: $(ip -h address)"
}

sys_sum(){
    echo "THIS IS A QUICK SYSTEM SUMMARY"
    echo " System Summary: $(neofetch)"
}


display_format_2(){


    case $1 in
        1)
            sys_info;;
        2)
             cpu_info;;
        3)
             mem_info;;
        4)
             disk_info;;
        5)
             network_info;;
        6)
             sys_sum;;
    esac
}









system_display
