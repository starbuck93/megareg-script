#!/bin/bash
if [ $# -ne 2 ]; then
    echo "$0": usage: ./register.sh 1 100
    exit 1
fi
for ((i=$1;i < $2;i++))
{
/home/ubuntu/megareg-script/register.sh $i
}
exit 0
