#! /bin/bash
count=$(cat test.json | wc -l)
# for((i=1;i<=count;i++));
for i in $(seq 1 $count)
do
data=`head -n 1 test.json| jq -r '.body'`
echo $data
echo "count":$i 
curl -X POST \
http://127.0.0.1:8080/v1/api/ \
-H 'Content-Type: application/json' \
-d "$data"
sleep 0.5 # sleep 0.5s
sed -i "" '1d' test.json #delete this raw
done