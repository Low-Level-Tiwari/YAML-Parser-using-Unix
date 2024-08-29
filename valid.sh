
# 1.1: 

# This script cuts the 1st word from the Validation script and then prints anything which is other than {grep, sed, awk, wc}.If nothing gets printed then result is True(1) else False(0).

cat test | cut -d' ' -f1 | grep -v 'awk\|sed\|grep\|wc' | awk 'END{if(NR==0){print 1}else{print 0}}' 




# 1.2:

# This 


