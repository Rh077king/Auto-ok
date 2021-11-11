echo ""
echo -e "\e[1;33m Enter A Google Dork:"
read dork
echo -e "Enter Number Of Pages:"
read page
echo >DList.txt
echo -e "\e[1;34m Please Wait... This May Take 1-2 Minutes..."
url="https://www.google.com/search?q="+$dork
curl -sA "Chrome" -L $url -o list1.txt
python2 ck.py list1.txt >DList.txt
echo " Dorking Started !!!"
half=$(( page/2 ))
if [ $page -gt 1 ];then
for (( i=1;i<$page;i++ ))
do
turl=$url"&start="$(( i*10 ))
fn="list"$(( i+1 ))".txt"
curl -sA "Chrome" -L $turl -o $fn
python2 ck.py $fn >>DList.txt
if [ $i -eq $half ];then
echo "50% Completed !!!"
fi
done
fi
echo "100% Completed !!!"
echo "List Created For Dork: "$dork
echo "Dork Result Saved in FileName: DList.txt"
echo " "
rm list*.txt
echo " "