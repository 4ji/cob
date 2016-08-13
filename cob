#!/bin/bash
KEY=`echo $@ | sed 's/ /%20/'`
echo $@ >> ~/.eng-list # 履歴を保存（不要なら削除）．
#URI="http://www.collinsdictionary.com/dictionary/english-cobuild-learners/$KEY"
URI="http://www.collinsdictionary.com/dictionary/english/$KEY"
#RS=`echo '▼ 検索結果本体 ▼' | nkf -w -w80`
#RS='definition_main'
#RS='definition_content'
RS='<span class=" orth">'
#RE=`echo '▲ 検索結果本体 ▲' | nkf -w -w80`
RE='Translations for '
curl  -e 'http://www.collinsdictionary.com/dictionary/' -A 'Mozilla/5.0' -s "$URI" | \
sed -ne "/$RS/,/$RE/p" | sed -e "/$RE/d" | w3m -dump -T 'text/html' | sed -e "s/\($KEY\)/[45m[37m\1[0m/g" | less -R
