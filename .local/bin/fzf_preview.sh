#! /bin/bash

if [[ -z "$1" ]]; then
	echo "provide one argument pls"
	exit 1
fi

input=$1

nf=$(echo $input | awk -F : '{ print NF }')


# know $nf >= 1 - 0 would be no input, so if@3 should catch that
if (( $nf == 1 )); then
	nf=$(echo $input | awk -F '"' '{ print NF }')
	if (( $nf == 1 )); then
		filename=$(echo $input | awk -F : '{print $1}')
		bat --style numbers --color=always $filename
		exit
	else
		filename=$(echo $input | awk -F '"' '{ print $2 }')
		bat --style numbers --color=always $filename
		exit
	fi
fi

filename=$(echo $input | awk -F : '{print $1}')
linenum=$(echo $input | awk -F : '{print $2}')
viewtop=$(($linenum - 10))
if (( "$viewtop" < 0 )); then
	viewtop=0
fi

bat --style numbers --color=always \
	-H $linenum \
	-r $viewtop: \
	$filename
