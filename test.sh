#!/bin/bash
clear
var1=58.125

integer_from_float(){
    
    integer=""

    for ((i=0; i<${#var1}; i++)){
        
        if [ "${var1:i:1}" == "." ] 
        then
            break
        else
            integer+=${var1:i:1}
        fi  
    }
    echo $integer
}

integer=""
float="0"
aut=0

for ((i=0; i<${#var1}; i++)){
    
    if [ "${var1:i:1}" == "." ] || (( aut == 1 )) 
    then
        float+=${var1:i:1}
        aut=1

    elif (( aut == 0 ))
    then
        integer+=${var1:i:1}
    fi  
}
echo $integer

integer_binary=$(echo "obase=2;${integer}" | bc)
echo $integer_binary

result=$(echo "$result*2" | bc)

echo $result

float_binary=''

#while true
do
    result=$(echo "$result*2" | bc)
    echo $result
    #float_binary+=$(integer_from_float result)
    #echo $float_binary
    #if (( $(integer_from_float result) == 1 ))
    #then 
    #    break
    #fi

done
#echo $integer_binary
#echo $float_binary