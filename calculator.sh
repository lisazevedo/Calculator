#!/bin/bash

source ./functions.sh

clear

echo " 

   ██████╗ █████╗ ██╗      ██████╗██╗   ██╗██╗      █████╗ ████████╗ ██████╗ ██████╗ 
  ██╔════╝██╔══██╗██║     ██╔════╝██║   ██║██║     ██╔══██╗╚══██╔══╝██╔═══██╗██╔══██╗
  ██║     ███████║██║     ██║     ██║   ██║██║     ███████║   ██║   ██║   ██║██████╔╝
  ██║     ██╔══██║██║     ██║     ██║   ██║██║     ██╔══██║   ██║   ██║   ██║██╔══██╗
  ╚██████╗██║  ██║███████╗╚██████╗╚██████╔╝███████╗██║  ██║   ██║   ╚██████╔╝██║  ██║
   ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
                                                                                     
                                                  BY: LIS AZEVEDO AND RICARDO RIBEIRO                   
"

echo "OPTIONS: 

1) Simple Floating Point (Integer: -127 ~ +127 | Float: -3.99 ~ +3.99 ) 
2) IEEE 754 Floating Point (32 bits or 64 bits) 
3) Big-Big 
4) Exit
"

read -p "Option: " option
echo
case $option in 

    1) read -p "Write the number: " number
        if [[ $number =~ "." ]] && (( $(echo "${number:1:7} > 3.9999" | bc) == 1 ))
        then
            echo "Invalid value!!"

        elif [[ $number != *"."* ]] && (( $(echo "${number:1:7} > 127" | bc) == 1 ))
        then
            echo "Invalid value!!"
        else
            if [[ $number =~ "." ]]
            then
                simple_floating_point_FLOAT number
            else
                simple_floating_point_INT number
            fi
        fi
        read
      
        ./calculator.sh ;;

    2)  read -p "Write the number: " number
        read -p "    1) 32 bits
    2) 64 bits
    " bits
        if (( $bits == 1 ))
        then
            ./float32 float $number
        elif (( $bits == 2 ))
        then      
            ./float32 double $number 
        else 
            echo "Invalid Option!!"  
        fi
        read        
        ./calculator.sh ;;
    
    3) echo "                                                  */,.//*  (                    
                           */,   .//,,*//*.               /,                   
                    (.     .                        .**** *.                   
                   /,..  .**,      .       . . // .(/.,**  /                   
                /...../  ****,.    &   &    %(     ./.   ,. /                  
               /..***,./  ***   .      *.(         .   *...                  
              ....****.*        (     .    (  #/*#    %    ..                  
              ,/.../*,..*.     .    *&&/#     *&&*.  /..(   /                  
                *........,     .    ***/   .      /     &.  /       # ., (..#  
                 *...*,....  .  / .        ..% *, .   (% .  /        . .#.##(*&
        ,         /.,**.....  /.......  /.      . *&,       *        %.,*  #*/(
 % #. /. &         ,....,.... /..&&*..             . .&     .*      &.  . *, /.
  .&. .. &         /*..***..   .. &%%%,.   .,/%...  ... //%,*% .&*       &(
&*, ..*/# /*         *.**,../     .&%%%%%%   .%&   #  *****./   (#             
#& .(    *&(  *&,  &*(#....../..**  #%%%%%%%%%%%%%.   .***  .*  (              
  .,,          ,&* .(   %....*       .&&&&%&%(&%%%,         /&,                
                 .  %     %...  ,****   (#,,,,,&(.    ***,  /                  
                   (%*    %.... *****  .,. ..,,,,...    .   ,                  
                       *.......  .,.            **,../*     %                  
                        *,/,//.. .///*,/#  ,* %#* (.   ,(%#(%                  
                         %*..../         ,(%((%#%&&&%(/%(////                  
                         &&&%#///&&&//#(//##%//////////(*                  
                         #####(/////////////(%&&(/%                        
                             (&&((#%&&&(.       (/////(.                       
                                #//////&         ,&&&                          
                                 #&&&&.           & &                          
                                  % (             & &                          
                                  # (             &*&                          
                                  %*#             % &                          
                                  % &            &&&&&&&.&&                    
                                 &&&&&,           &&&&&&&&&                    
                                 &&&&&&*#&&            ,*                      
                                  *&%%&&&&,    " 
        read                          
        ./calculator.sh ;;
    4) exit ;;     

    *) echo "invalid option!!" 
        read
        ./calculator.sh ;;
esac



