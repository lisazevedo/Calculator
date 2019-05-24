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
    
    num1=0
    var1=""
    
    if ((${#integer_binary} < 2)) 
    then    
        while (( $num1 < $(( 2-${#integer_binary} )) ))
        do
            var1+="0"
            (( num1 = num1 + 1 ))
        done
    fi
    
    integer_binary=$var1$integer_binary

    array_res[0]=$(sign_simple_floating number)
    array_res[1]=$integer_binary
    array_res[2]='.'

    result=$(echo "$float*2" | bc)

    float_binary=""
    count=0

    while true
    do
        if (( $(echo "$result > 1.00" | bc) == 1 ))
        then
            float_binary="${float_binary}1"
            result=$(echo "scale=2; $result-1.0" | bc)
        
        elif (( $(echo "$result == 1.00" | bc) == 1 ))
        then
            float_binary="${float_binary}1"
            break
        else
            float_binary="${float_binary}0"
        fi

        if ((count == 4 ))
        then 
            break
        fi
        ((count+=1))
        result=$(echo "$result*2" | bc)
    done

    num2=0
    var2=""
    
    if ((${#float_binary} < 5)) 
    then    
        while (( $num2 < $(( 5-${#float_binary} )) ))
        do
            var2+="0"
            (( num2 = num2 + 1 ))
        done
    fi
    float_binary=$float_binary$var2
    array_res[3]=$float_binary
    echo
    echo "Binary Representation: ${array_res[0]}$integer_binary"."$float_binary"
    echo
    echo "Sign: ${array_res[0]}" 
    echo "Exponent: $integer_binary${float_binary:0:1}"
    echo "Mantissa: ${float_binary:1:5}"
    hexadecimal=$(echo "obase=16;ibase=2;${array_res[0]}$integer_binary$float_binary" | bc)
    echo "Hexedecimal: $hexadecimal"

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
    echo "Binary Representation: ${array_res[@]}"
    echo "Sign: ${array_res[0]}" 
    echo "Exponent: ${array_res[1]}"
    echo "Mantissa: ${array_res[2]}"
    hexadecimal=$(echo "obase=16;ibase=2;"${array_res[0]}${array_res[1]}${array_res[2]}"" | bc)
    echo "Hexedecimal: $hexadecimal"
   # printf '%x\n' "$((2#"${array_res[0]}${array_res[1]}${array_res[2]}"))"
}