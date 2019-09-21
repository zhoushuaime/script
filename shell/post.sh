#! /bin/bash
filename=test.json # can be from args 
if [ ! -f "$filename" ]; then
    echo "no such file:"$filename
    exit 1
fi
count=$(cat $filename | wc -l)
if [ $count -eq 0 ]; then
    echo "file count is zero"
    exit 1
fi
# for((i=1;i<=count;i++));
for i in $(seq 1 $count); do
    data=$(head -n 1 $filename | jq -r '.body')
    echo $data
    echo "count":$i
    curl -X POST \
        http://127.0.0.1:8080/v1/api/ \
        -H 'Content-Type: application/json' \
        -d "$data"
    sleep 0.5                # sleep 0.5s
    sed -i "" '1d' $filename #delete this raw
done
