FILENAME="packages_list.txt"

adb shell pm list package > ./$FILENAME;
echo "PACKAGE LIST: ./$FILENAME";

cat ./$FILENAME | sed -e 's/package://g' | while read LINE;do
 APKNAME=`echo ${LINE} | tr -d '\r'`
  
if [ ! -e $APKNAME.ab ]; then
  adb backup -f "$APKNAME" -apk $APKNAME.ab;
  echo "PACKAGE SAVED:  ${APKNAME} \n";
else
  echo "$APKNAME.ab ALREADY BACKUP. SKIP THIS PACKAGE.";
fi

done