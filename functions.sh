#!/bin/bash

sign_simple_floating(){
    
    if [ "${number:0:1}" == "+" ] 
    then
        echo 0
    else
        echo 1
    fi
}

simple_floating_point_FLOAT(){
    
    declare -a array_res

    integer=""
    float="0"
    aux=0
    
    for ((i=0; i<${#number}; i++)){
        
        if [ "${number:i:1}" == "." ] || (( aux == 1 )) 
        then
            float+=${number1:i:1}
            aux=1

        elif (( aut == 0 ))
        then
            integer+=${number:i:1}
        fi
    }      
    
    integer_binary=$(echo "obase=2;${integer}" | bc)

    array_res[0]=$(sign_simple_floating number)
    array_res[1] = $integer_binary
    array_res[2] = '.'



    array_res[3] = $float_binary

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
    echo "Sign: ${array_res[0]}" 
    echo "Exponent: ${array_res[1]}"
    echo "Mantissa: ${array_res[2]}"
}


