#!/bin/bash
# (script) name extension number route
error() {
    echo $1
    exit 1
}

#Check parameters with (#$ -ne)
if [ $# -ne 4 ]; then
    error "How to use: $0: name extension number route"
fi

#Specified Directory (! -d)
if [ ! -d $4 ]; then
    error "Error: the directory dosn't exist"
fi

#Number of minimum files
if [ $3 -lt 1 ]; then
    error "Error: please select a number of files above 0"
fi

#File generator 
for (( i = 1; i <= $3; i++ )); do
    name="$4/$1$i.$2"
    if [ $i -lt 10 ]; then
        name="$4/$10$i.$2"
    fi
    touch $name
    echo "Fichero $name creado" | tr -s /
done
