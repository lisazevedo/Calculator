#!/bin/bash

#functions

decimal_to_binary(){

    echo "obase=2;${number8:1:4}" | bc
}

less_8_bits(){
    var=""
    num=0
    while (( $num < $(( 7-${#binary} )) ))
    do
        var+="0"
        (( num = num + 1 ))
    done

    echo "$var$binary"
}

simple_floating_point(){
    
    declare -a array_res

    binary=$(decimal_to_binary number8)
    
    if (( ${#binary} < 7 ))
    then 
        binary=$(less_8_bits binary)
    fi    
    

    if [ "${number8:0:1}" == "+" ] 
    then
        array_res[0]=0
    else
        array_res[0]=1
    fi 

    array_res[1]=${binary:0:3}
    array_res[2]=${binary:3:4}
    
    echo
    echo "Sign: ${array_res[0]}" 
    echo "Exponent: ${array_res[1]}"
    echo "Mantissa: ${array_res[2]}"
}
#--------------------- END FUNCTIONS ---------------------------
clear

echo " 

   ██████╗ █████╗ ██╗      ██████╗██╗   ██╗██╗      █████╗ ████████╗ ██████╗ ██████╗ 
  ██╔════╝██╔══██╗██║     ██╔════╝██║   ██║██║     ██╔══██╗╚══██╔══╝██╔═══██╗██╔══██╗
  ██║     ███████║██║     ██║     ██║   ██║██║     ███████║   ██║   ██║   ██║██████╔╝
  ██║     ██╔══██║██║     ██║     ██║   ██║██║     ██╔══██║   ██║   ██║   ██║██╔══██╗
  ╚██████╗██║  ██║███████╗╚██████╗╚██████╔╝███████╗██║  ██║   ██║   ╚██████╔╝██║  ██║
   ╚═════╝╚═╝  ╚═╝╚══════╝ ╚═════╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
                                                                                     
                                                    BY: LIS AZEVEDO AND EWERTON ALVES                    
"

echo "OPTIONS: 

1) Simple Floating Point (8 bits) 
2) IEEE 754 Floating Point (32 bits or 64 bits) 
3) Floating Point to Hexadecimal
4) Big-Big 
5) Exit
"

read -p "Option: " option
echo
case $option in 
    1) read -p "Write the number (-127 ~ +127): " number8
        simple_floating_point number8
        read
      
        ./calculator.sh ;;
    2) echo 2
        ./calculator.sh ;;
    3) echo 3 ;;

    4) echo "                                                  */,.//*  (                    
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
    5) exit ;;     

    *) echo "invalid option!!" 
        read
        ./calculator.sh ;;
esac



