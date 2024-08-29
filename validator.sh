#-------------------------------------------------------------------------------------------------------------------

#pred-obj-2-1-1		: Taken Care while Construction



#pred-obj-2-2-1		: Teams names should be alphabetic
sed 's/ //' Step2/teams|grep '[^[:alpha:]]'|awk 'END{if(NR==0){print 1}else{print 0}}' > result

#pred-obj-2-2-2		: Number of teams must be 2
awk 'END{if(NR==2){print 1}else{print 0}}' Step2/teams >> result




#pred-obj-2-3-1		: Player names should be alphabetic
sed 's/ //' Step2/players|grep '[^A-Za-z ]'|awk 'END{if(NR==0){print 1}else{print 0}}' >> result

#pred-obj-2-3-2		: Total number of players must be less than 23
wc -l Step2/players|sed 's/ .*//'|awk '{if($0 < 23){print 1}else{print 0}}' >> result




#pred-obj-2-4-1		: Kind of Wickets should be from this set {bowled, caught, caught and bowled, hit wicket, lbw, obstructing the field, retired hurt, retired out, run out, stumped}
awk '{if($0==" bowled" || $0==" caught" || $0==" run out" || $0==" caught and bowled" ||$0==" hit wicket" || $0==" lbw" || $0==" obstructing the field" ||$0==" retired hurt" || $0==" retired out" || $0==" stumped"){print 1}else{print 0}}' Step2/wicket_kind >> result 

#pred-obj-2-4-2		: Number of wickets should be less than 21
wc -l Step2/wicket_kind|sed 's/ .*//'|awk '{if($0 < 21){print 1}else{print 0}}' >> result




#pred-obj-2-5-1		: Runs should be Numeric 
sed 's/ //' Step2/runs|grep '[^0-9]'|awk 'END{if(NR==0){print 1}else{print 0}}' >> result

#pred-obj-2-5-2		: Run < 12
awk '{if($0>12){print 0}else{print 1}}' Step2/runs >> result




#pred-obj-2-6-1		: Decision of toss should belong to {bat, field}
awk '{if($0==" bat" || $0==" field"){print 1}else{print 0}}' Step2/toss-decision >> result 

#pred-obj-2-6-1		: |Decision| = 1
awk 'END{if(NR==1){print 1}else{print 0}}' Step2/toss-decision >> result



#pred-obj-2-7-1		: Winner-Match ∈ Teams
k=$(sed 's/ //g' Step2/match-winner);awk "/$k/{z=1;exit}END{if(z==1){print 1}else{print 0}}" Step2/teams >> result

#pred-obj-2-7-2		: |Winner-Match| <= 1
awk 'END{if(NR<=1){print 1}else{print 0}}' Step2/match-winner >> result




#pred-obj-2-8-1		: Venue of the match should be alphabetic

#pred-obj-2-9-1		: Umpires names shoube be Alphabetic


#pred-obj-2-10-1		: Over Numbers should be Numeric
#pred-obj-2-10-2		: Over Numbers should be less than 20 (Only in T20)
#pred-obj-2-10-3		: Start with 0
#pred-obj-2-10-4		: Must be strictly increasing 
#pred-obj-2-10-5		: No gaps


#pred-obj-2-11-1		: Ball Numbers should be Numeric
#pred-obj-2-11-2		: Start with 1
#pred-obj-2-11-3		: Must be strictly increasing 
#pred-obj-2-11-4		: No gaps



#pred-obj-2-8-1		: Venue of the match ∈ L*, L={A-Za-z }.....(Includes Space)


#pred-obj-2-9-1		: Umpires names ∈ L*, L={A-Za-z }.....(Includes Space)


#pred-obj-2-10-1		: |OverSequence| <= 20 (Only in T20 without super overs)
#pred-obj-2-10-2		: (line,x,pos) ∈ OverSeq -> ((line,pos ∈ N) and (x ∈ {0,1,2...19}) and ((a,0,0) ∈ OverSeq) and 
#			  ((line',x',f(pos)) ∈ OverSeq (line ‡ line' and x ‡ x') -> ((line' > line) and (x' ≥ x))) and
#			  ((i,f(j),k) ∈ OverSeq and j‡0 -> (i',j,k') ∈ OverSeq))
#
#
#pred-obj-2-11-1		: (line,x,pos) ∈ BallSeq -> ((line,x,pos ∈ N ) and (x ∈ {1,2,3...14}) and ((a,1,0) ∈ BallSeq) and 
#			  ((line',x',f(pos)) ∈ BallSeq (line ‡ line' and x' ‡ 1) -> ((line' > line) and (x' > x))) and
#			  ((i,f(j),k) ∈ BallSeq and j‡0 -> (i',j,k') ∈ BallSeq))
#
#
#pred-obj-2-12-1		: (y,m,d)≡Date -> (y>=1800 and y<=2024) and (m>=1 and m<=12) and 
#			  ((m ∈ {1,3,5,7,8,10,12} -> d<=31) and (m ∈ {4,6,9,11} -> d<=30)) and
#			  (((Rem(y,4)≡0) and m≡2) -> d<=29) and (((Rem(y,4)‡0) and m≡2) -> d<=28)
#

#pred-obj-2-13-1		: City ∈ L*, L={A-Za-z }.....(Includes Space)

#pred-obj-2-14-1		: Gender ∈ {'male','female'}

#pred-obj-2-15-1		: Match Type ≡ "T20"

#pred-obj-2-16-1		: Won by Wickets ∈ L*, L={0-9}
#pred-obj-2-16-2		: Won by Wickets <= 10

#pred-obj-2-17-1		: Won by Runs ∈ L*, L={0-9}
#pred-obj-2-17-2		: Won by Runs <= 10

#pred-obj-2-18-1		: Number of Overs ≡ 20...(In T20)
#
#pred-obj-2-19-1		: Winner-Toss ∈ Teams
#pred-obj-2-19-2		: |Winner-Toss| ≡ 1

#--------------------------------------------------------------------------------------------------------------------


#-------------------------------------------------------------------------------------------------------------------

#pred-obj-3-1		: Tuple of Team Name and Set of Players
#pred-obj-3-2 		: Overwise Sequence of Total Runs in an Inning
#pred-obj-3-3 		: Overwise Sequence of Batsman Runs in an Inning
#pred-obj-3-4 		: Overwise Sequence of Extras Runs in an Inning
#pred-obj-3-5 		: Overwise Sequence of Batsman Names
#pred-obj-3-6 		: Overwise Sequence of Non-Striker Names
#pred-obj-3-7 		: Overwise Sequence of Bowlers Names
#pred-obj-3-8 		: Overwise Sequence of Batsmans
#pred-obj-3-9 		: Overwise Sequence of Batsmans
#pred-obj-3-10		: Overwise Sequence of wickets
#
