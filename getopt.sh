#!/bin/bash

#set defaults here
bvar=0
svar="" 
nvar=-1


display_usage() {
  echo "Usage: getopt.sh [-h][-b][-s <string>]"
  echo ""
  echo "Demonstrates how to do argument parsing in bash using getopts"
  echo ""
  echo "-h, --help        Show this help message and exit"
  echo "-b, --help        Boolean flag. If none is given, will default to 0, 1 otherwise. "
  echo "-s, --help        String argument. Will take the value provided. Mandatory value."
  echo "-n, --help        Numerical argument. If none is given, will default to -1."
}

while getopts "hbs:n:" opt; do #variables that take an argument are followed by a colon 
  case ${opt} in
    h | \? | help )
      display_usage; 
      exit 0 
      ;;
    b )
      bvar=1
      ;;
    s )
      svar=$OPTARG
      ;;
    n )
      nvar=$OPTARG
    esac
done

#check for mandatory values
if [ -z $svar ]; then
   echo "Error. String (-s) argument must be provided"
   exit 1
fi

echo "bvar=" $bvar
echo "svar=" $svar
echo "nvar=" $nvar
