DOT_FILE=dag

sed "s/rounded/filled/" $DOT_FILE.dot >$DOT_FILE.tex
# sed -i 's/style="rounded"/style="filled", shape="circle"/g' $DOT_FILE.tex
# 's/style="rounded"/style="filled", shape="circle"/g'
# sed -i "s/margin=0/margin=0, model=\"subset\",/g" $DOT_FILE.tex
# neato -Tpdf $DOT_FILE.tex > dag.pdf

(/bin/cat $DOT_FILE.tex | grep -v "> 0\|0\[label = \"(.*)?(tab|fig|plot)(.*)?\"") >tmp.tex
mv tmp.tex $DOT_FILE.tex
sed -i 's/label = \".*\", color/color/g' $DOT_FILE.tex
open $DOT_FILE.tex
neato -Tpdf $DOT_FILE.tex >dag.pdf

# vim:foldmethod=marker
