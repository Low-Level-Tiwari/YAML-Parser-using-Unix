#-------------------------------------------------------------------------------------------------------------
mkdir Step2

#obj-2-1		: Innings from yaml file
sed -n '/1st/,/2nd/p' $1 > Step2/inning1 && sed -ne '/2nd/,$ p' $1 > Step2/inning2


#obj-2-2		: Set of Team names
sed -n '/teams:/,/toss/p' $1 | sed -n 's/\- //p'| sed -n 's/ *//p' > Step2/teams


#obj-2-3		: Set all Players
sed -n '/(batsman:\|bowler:\|non_striker:) [A-Z]/p' $1|cut -d: -f2|sort|uniq > Step2/players
sed -n '/fielders/,/kind/p' $1|grep '-'|cut -d- -f 2|sort|uniq >> Step2/players


#obj-2-4 		: Set of kind of Wickets
grep 'kind: ' $1|cut -d: -f2 > Step2/wicket_kind


#obj-2-5		: Set of all sort of Runs
sed -n '/batsman: [0-9]\|extras: [0-9]\|total: [0-9]/p' $1|cut -d: -f2|sort|uniq > Step2/runs


#obj-2-6		: Decision of toss
grep 'decision: ' $1| cut -d: -f2 > Step2/toss-decision


#obj-2-7		: Winner of match
sed -n '/outcome/,/over/p' $1|grep -o 'win.*'|grep -o ' .*' > Step2/match-winner


#obj-2-8		: Venue of the match
grep 'venue: ' $1| cut -d: -f2 > Step2/venue


#obj-2-9		: Set of Umpires of the match
sed -n '/umpire/,/venue/p' $1| sed -n 's/\-//p'| sed 's/ *//' > Step2/umpires


#obj-2-10		: Sequence of Overs with Line Numbers
sed -n '/1st/,/2nd/p' $1|grep -n '^  *- [0-9][^a-z]'|sed 's/:  *-//'|sed 's/\.[0-9]://' > Step2/over1
sed -ne '/2nd/,$ p' $1|grep -n '^  *- [0-9][^a-z]'|sed 's/:  *-//'|sed 's/\.[0-9]://' > Step2/over2


#obj-2-11		: Sequence of Ball numbers in all overs with Line Numbers
sed -n '/1st/,/2nd/p' $1| grep -n -o '\.[0-9]'|sed 's/:\./ /' > Step2/balls1
sed -ne '/2nd/,$ p' $1| grep -n -o '\.[0-9]'|sed 's/:\./ /' > Step2/balls2


#obj-2-12		: Date
sed -n '/dates:/,+1p' $1|grep -o '[0-9]*' > Step2/date


#obj-2-13		: City
grep 'city' $1|sed 's/^.*: //' > Step2/city


#obj-2-14		: Gender
grep 'gender' $1|sed 's/^.*: //' > Step2/gender


#obj-2-15		: Match Type
grep 'match_type:' $1|sed 's/^.*: //' > Step2/match_type


#obj-2-16		: Won by Number of Wickets
grep 'wickets:' $1|sed 's/^.*: //' > Step2/won-by-wickets


#obj-2-17		: Won by Number of Runs
grep -n 'runs: [0-9][0-9]*' $1|sed 's/^.*: //' > Step2/won-by-runs


#obj-2-18		: Total Number of overs in Match Type
sed -n '/overs: /p' $1|cut -d' ' -f4 > Step2/total-overs


#obj-2-19		: Winner of Toss
grep -A2 'toss' $1|grep -o 'w.*'|grep -o ' .*' > Step2/toss-winner



#----------------------------------------------------------------------------------------------------------------
#mkdir Step3

#obj-3-1		: Tuple of Team Name and Set of Players
#obj-3-2 	: Overwise Sequence of Total Runs in an Inning
#obj-3-3 	: Overwise Sequence of Batsman Runs in an Inning
#obj-3-4 	: Overwise Sequence of Extras Runs in an Inning
#obj-3-5 	: Overwise Sequence of Batsman Names
#obj-3-6 	: Overwise Sequence of Non-Striker Names
#obj-3-7 	: Overwise Sequence of Bowlers Names
#obj-3-8 	: Overwise Sequence of Batsmans
#obj-3-9 	: Overwise Sequence of Batsmans
#obj-3-10	: Overwise Sequence of wickets
