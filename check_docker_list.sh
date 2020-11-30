declare -r output='zzzzzzzzxxxxxxxxx' 
#Parsing Arguments (Array)
declare -a id=($@)

#Declare Status
declare -i ok_status='0'
declare -i bad_status='1'

#Declare Exit Code
declare -i ok_exit='0'
declare -i bad_exit='2'

#Declare Array
declare -a found
declare -a not_found


#Confirm Arguments
if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 2
fi

#Iterate over array and execute command
for x in ${id[@]}  
    do
    echo $output | grep $x > /dev/null 2>&1

    export status=$? 
    
    if [ $status -eq $ok_status ]; then
        found+=$x' is running! ' 
    elif [ $status -eq $bad_status ]; then
        not_found+=$x' is not running! '
    fi
done


#Exit Status
if [ ${#not_found[@]} -gt 0 ]; then
    echo 'CRITICAL: '$not_found'''(OK: '$found')'
    exit $bad_exit
else
    echo 'OK: '$found''
    exit $ok_exit
fi
