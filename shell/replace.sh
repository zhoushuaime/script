for file  in *; do
   if [ -f "$file" ];then
      echo "$file"
     sed -i "" 's/A/B/g' $file;
   fi
done