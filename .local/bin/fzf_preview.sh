#! /bin/bash

if [[ -z "$1" ]]; then
	echo "provide one argument pls"
	exit 1
fi

input=$1

nf=$(echo $input | awk -F : '{ print NF }')

filename=$(echo $input | awk -F : '{print $1}')


# know $nf >= 1 - 0 would be no input, so if@3 should catch that
if (( $nf == 1 )); then
	bat --style numbers --color=always $filename
fi

# know $nf >= 2
echo $filename
echo $nf

linenum=$(echo $input | awk -F : '{print $2}')
viewtop=$(($linenum - 10))
if (( "$viewtop" < 0 )); then
	viewtop=0
fi

bat --style numbers --color=always \
	-H $linenum \
	-r $viewtop: \
	$filename
