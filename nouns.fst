%#LowerCase# = a-z
%#UpperCase# = A-Z
%"tester.txt" \
%[#UpperCase#]:[#LowerCase#]* |\

ALPHABET = [a-z]
$non-vowels$ = ([a-z]&!(a|e|i|o|u))
$vowels$ = a|e|i|o|u

%Define a rule that does not allow more than three consecutive non-vowel letters
$<4_consonants$ = ![a-z]*($non-vowels$$non-vowels$$non-vowels$($non-vowels$)+)[a-z]*

%Define a rule that does not allow a consonent to be consecutive to the same consonent
$double_consonent$ = bb | cc | dd | ff | gg | hh | jj | kk | ll | mm | nn | pp | qq | rr | ss | tt | vv | ww | xx | yy | zz
$double_rule$ = !([a-z]*($double_consonent$)[a-z]*)

%Define a rule that does not allow more than two consecutive vowels
$<2_vowels$ = ![a-z]*($vowels$($vowels$)+)[a-z]*
	   
%Copulative Concords which are added in front of the noun class prefix : Page 23 of Speak Xhosa with us beginner to advanced
$ng$ = <>:<> ({<>}:{ng}) 		%1a, 1, 3, 2, 2a, 6
$yi$ = <>:<> ({<>}:{y}) 		%4, 9
$li$ = <>:<> ({<>}:{l})			%5
$si$ = <>:<> ({<>}:{s})			%7
$zi$ = <>:<> ({<>}:{z})			%8, 10
$lu$ = <>:<> ({<>}:{l})			%11
$bu$ = <>:<> ({<>}:{b})			%14
$ku$ = <>:<> ({<>}:{k})			%15

%Copulative Concords which are added in front of the noun class prefix and make the noun class prefix to lose the initial vowel
$asingo$ = <>:<> ({<>}:{asingo})        %1a, 1, 3, 2, 2a, 6
$asiyo$ = <>:<> ({<>}:{asiyo}) 		%4, 9
$asilo$ = <>:<> ({<>}:{asilo}) 		%5
$asiso$ = <>:<> ({<>}:{asiso}) 		%7
$asizo$ = <>:<> ({<>}:{asizo}) 		%8, 10
$asilo$ = <>:<> ({<>}:{asilo}) 		%11
$asibo$ = <>:<> ({<>}:{asibobu}) 		%14
$asiko$ = <>:<> ({<>}:{asikoku} | {<>}:{asikokw}) 		%15

%Stems for the noun classes
$stem$ = ($<4_consonants$&$<2_vowels$&$double_rule$)($non-vowels$)(a|e|i|o|u)

%Noun class prefixes
$ihlelo_1$ = (um)$stem$		%1 related plural forms sometimes found in 2,4 and 6
$ihlelo_2$ = (aba|abe)$stem$	 	%2
$ihlelo_1a$ = u$stem$			%1A
$ihlelo_2a$ = (oo)$stem$		%2A
$ihlelo_3$ = (um|u)$stem$		%3
$ihlelo_4$ = (imi|im)$stem$	 	%4
$ihlelo_5$ = (ili|i)$stem$		%5
$ihlelo_6$ = (ama|ame)$stem$			  	%6
$ihlelo_7$ = (isi|(is(a|o|e)))$stem$		 	%7
$ihlelo_8$ = (izi|iza)$stem$		 		%8
$ihlelo_9$ = (in|im|i)$stem$		 		%9
$ihlelo_10$ =  (izin|izim|iin|iim|ii)$stem$		%10
$ihlelo_11$ = (ulu|ulw|ul|u)$stem$			%11
$ihlelo_14$ =  (Ubu|utyw|uty|ubu|ub|u)$stem$		%14
$ihlelo_15$ = (uku|ukw|uk)$stem$		 	%15

%Using 'na' to express possession
%Subject Concords for nouns
$sc$ = <>:<> (\
		  {<>}:{u} | {<>}:{ndi}|\ %class 1a nd 1
		  {<>}:{ba} |\ 		%class 2a nd 2
		  {<>}:{u} |\ 		%class 3
		  {<>}:{i} |\ 		%class 4 and 9
		  {<>}:{li} |\ 		%class 5
		  {<>}:{a} |\		%class 6
		  {<>}:{si} |\		%class 7
		  {<>}:{zi} |\	 	%class 8 and 10
		  {<>}:{lu} |\ 		%class 11
		  {<>}:{bu} |\ 		%class 14
		  {<>}:{ku}) 		%class 15

$p-na$ = <>:<> ({<>}:{ne} | {<>}:{no} | {<>}:{noo} | {<>}:{na} | {<>}:{nee})

%===============================================================================

%The Adverbal Formative 'Nga'

$ad_nga$ = <>:<> ({<>}:{nge} | {<>}:{ngo} | {<>}:{nga} | {<>}:{ngoo} | {<>}:{ngee})

%===============================================================================

%Basic Noun Prefixes
$basic_np$ = <>:<> (\
		  {<>}:{m} |\ 		%class 1, 1a and 3
		  {<>}:{ba} |\ 		%class 2
		  {<>}:{bo} |\          %class 2a
		  {<>}:{mi} |\ 		%class 4
		  {<>}:{li} |\ 		%class 5
		  {<>}:{ma} |\		%class 6
		  {<>}:{si} |\		%class 7
		  {<>}:{zi} |\	 	%class 8 
		  {<>}:{n} |\ 		%class 9
		  {<>}:{zin} |\	 	%class 10
		  {<>}:{lu} |\ 		%class 11
		  {<>}:{bu} |\ 		%class 14
		  {<>}:{ku}) 		%class 15

%$basic_np$ $stem$ |\
%These cause overgeneration and thus decreases our spelling checker accuracy
%===============================================================================

$ad_nga$ $stem$ |\		%The Adverbal Formative 'Nga'
$sc$$p-na$$stem$ |\		%these are the rules for using 'na' to express possession
($asingo$ | $asiyo$ | $asilo$ | $asiso$ | $asizo$ | $asilo$ | $asibo$ | $asiko$)$stem$ |\
($ng$$ihlelo_1$ | $ng$$ihlelo_1a$ | $ng$$ihlelo_2$ | $ng$$ihlelo_2a$ | $ng$$ihlelo_3$ | $yi$$ihlelo_4$ | $li$$ihlelo_5$ | $ng$$ihlelo_6$ | $si$$ihlelo_7$ | $zi$$ihlelo_8$ | $yi$$ihlelo_9$ | $zi$$ihlelo_10$ | $lu$$ihlelo_11$ | $bu$$ihlelo_14$ | $ku$$ihlelo_15$) |\
($ihlelo_1$ | $ihlelo_1a$ | $ihlelo_2$ | $ihlelo_2a$ | $ihlelo_3$ | $ihlelo_4$ | $ihlelo_5$ | $ihlelo_6$ | $ihlelo_7$ | $ihlelo_8$ | $ihlelo_9$ | $ihlelo_10$ | $ihlelo_11$ | $ihlelo_14$ | $ihlelo_15$)










