#!/bin/bash


#save hostname to a variable

hostname=

#save number of CPU to a variable
lscpu_out=`lscpu`
#note: `xargs` is a trick to remove leading and trailing white spaces
cpu_number=$(echo "$lscpu_out"  | egrep "^CPU\(s\):" | awk '{print $2}' | xargs)

echo $cpu_number




cpu_model=$(echo "$lscpu_out"  | sed -n 's/Model name:[ \t]*//p' | awk '{print $2}' | xargs)

#hardware
hostname=$(hostname -f)

cpu_number=
cpu_architecture=
cpu_model=
cpu_mhz=
l2_cache=
total_mem=
timestamp= #current timestamp in `2019-11-26 14:40:19` format




cpu_model=
cpu_mhz=
l2_cache=
total_mem=
#timestamp= #current timestamp in `2019-11-26 14:40:19` format

