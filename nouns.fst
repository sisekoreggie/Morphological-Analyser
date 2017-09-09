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

%Basic noun rules
$ihlelo_1$ = um($<4_consonants$&$<2_vowels$&$double_rule$)($non-vowels$)(a|e|i|o|u)		%1 related plural forms sometimes found in 2,4 and 6
$ihlelo_2$ = ab(a|e)($<4_consonants$&$<2_vowels$&$double_rule$)($non-vowels$)(a|e|i|o|u) 	%2
$ihlelo_1a$ = u($<4_consonants$&$<2_vowels$&$double_rule$)($non-vowels$)(a|e|i|o|u)		%1A
$ihlelo_2a$ = oo($<4_consonants$&$<2_vowels$&$double_rule$)($non-vowels$)(a|e|i|o|u) 		%2A
$ihlelo_3$ = u(m)?($<4_consonants$&$<2_vowels$&$double_rule$)($non-vowels$)(a|e|i|o|u) 	%3
$ihlelo_4$ = im(e|i)?($<4_consonants$&$<2_vowels$&$double_rule$)($non-vowels$)(a|e|i|o|u) 	%4
$ihlelo_5$ = i(li)?($<4_consonants$&$<2_vowels$&$double_rule$)($non-vowels$)(a|e|i|o|u)  	%5
$ihlelo_6$ = am(a)?($<4_consonants$&$<2_vowels$&$double_rule$)($non-vowels$)(a|e|i|o|u)  	%6
$ihlelo_7$ = is(a|i)?($<4_consonants$&$<2_vowels$&$double_rule$)($non-vowels$)(a|e|i|o|u) 	%7
$ihlelo_8$ = iz(a|i)?($<4_consonants$&$<2_vowels$&$double_rule$)($non-vowels$)(a|e|i|o|u) 	%8
$ihlelo_9$ = i(n|m)?($<4_consonants$&$<2_vowels$&$double_rule$)($non-vowels$)(a|e|i|o|u) 	%9
$ihlelo_10$ = i(i(n|m)?|zi(n|m))($<4_consonants$&$<2_vowels$&$double_rule$)($non-vowels$)(a|e|i|o|u) 	%10
$ihlelo_11$ = u(l|lu|lw)?($<4_consonants$&$<2_vowels$&$double_rule$)($non-vowels$)(a|e|i|o|u)		%11
$ihlelo_14$ = u(b|bu|ty|tyw)?($<4_consonants$&$<2_vowels$&$double_rule$)($non-vowels$)(a|e|i|o|u) 	%14
$ihlelo_15$ = uk(u|w)?($<4_consonants$&$<2_vowels$&$double_rule$)($non-vowels$)a 			%15

%Compound noun rules
%isibizo1+isibizo2 = (pref1+root1+suffix1)+(root1+suffix1)
$coumpound_1$ = ($non-vowels$)($<4_consonants$&$<2_vowels$&$double_rule$)($non-vowels$)(a|e|i|o|u)  

%isibizo+isimelabizo: Remove the ending 'na' in isimelabizo zoqobo
$esoqobo$ = <>:<> ({<>}:{m} | {<>}:{we}| {<>}:{thi} | {<>}:{ni} | {<>}:{yo} | {<>}:{so} | {<>}:{zo} | {<>}:{lo} |\
		{<>}:{bo} | {<>}:{wo} | {<>}:{ko} | {<>}:{ye} | {<>}:{bo} | {<>}:{lo} | {<>}:{wo})

%Combining the rules for recognition
$ihlelo_1$ ($coumpound_1$) |\
($ihlelo_1$ | $ihlelo_1a$ | $ihlelo_2$ | $ihlelo_2a$ | $ihlelo_3$ | $ihlelo_4$ | $ihlelo_5$ | $ihlelo_6$ | $ihlelo_7$ | $ihlelo_8$ | $ihlelo_9$ | $ihlelo_10$ | $ihlelo_11$ | $ihlelo_14$ | $ihlelo_15$) ($esoqobo$)? ("iziphawuli.txt")?











