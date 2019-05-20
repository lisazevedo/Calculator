#!/bin/bash

sign_simple_floating(){
    
    if [ "${number:0:1}" == "+" ] 
    then
        echo 0
    else
        echo 1
    fi
}

integer_from_float(){
    
    integer=""
    if [ "${result:0:1}" == "." ]
    then 
        integer=0
        echo $integer
    else
        integer=${result:0:1}
        echo "scale=2 ; $integer/1.0" | bc
    fi    
}

simple_floating_point_FLOAT(){
    
    declare -a array_res

    integer=""
    float="0"
    aux=0
    
    for ((i=1; i<${#number}; i++)){
        
        if [ "${number:i:1}" == "." ] || (( aux == 1 )) 
        then
            float+=${number:i:1}
            aux=1

        elif (( aut == 0 ))
        then
            integer+=${number:i:1}
        fi
    }      
    
    integer_binary=$(echo "obase=2;${integer}" | bc)
    
    array_res[0]=$(sign_simple_floating number)
    array_res[1]=$integer_binary
    array_res[2]='.'

    result=$(echo "$float*2" | bc)

    float_binary=''

    while true
    do
        aux=$(integer_from_float result)
        
        result=$(echo "$result*2" | bc)

        float_binary="$float_binary$aux"

        if (( aux == 1.00 ))
        then
            break 
        fi 
    done

    array_res[3]=$float_binary

    echo "$integer_binary"."$float_binary"
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

simple_floating_point_INT(){
    
    declare -a array_res

    binary=$(echo "obase=2;${number:1:4}" | bc)
    
    if (( ${#binary} < 7 ))
    then 
        binary=$(less_8_bits binary)
    fi    
    
    array_res[0]=$(sign_simple_floating number)
    
    array_res[1]=${binary:0:3}
    array_res[2]=${binary:3:4}
    
    echo
    echo "Binary Number: ${array_res[@]}"
    echo "Sign: ${array_res[0]}" 
    echo "Exponent: ${array_res[1]}"
    echo "Mantissa: ${array_res[2]}"
}
