BEGIN{seen=0;once=0}

/meta/ {mkdir "FILENAME";}

/total:/ {runs = runs $2" ";seen=1}

/batsman: [^0-9]/ {bats = bats $2" "$3" "}

/non_striker:/ {non=non $2" "$3" "}

/^ *- [0-9]*\.1:$/ && seen==1 {runs=runs"\n";bats=bats"\n";non=non"\n"}

/2nd/ {print bats>FILENAME/batman1; print non>FILENAME/non_striker1;print runs>FILENAME/Inning1;runs="";bats="";non="";seen=0}

END{print bats>FILENAME/batsman2;print non>FILENAME/non_striker2;print runs>FILENAME/Inning2;}
