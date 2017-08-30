%#LowerCase# = a-z
%#UpperCase# = A-Z
%"tester.txt" \
%[#UpperCase#]:[#LowerCase#]* |\

ALPHABET = [a-z]
$non-vowels$ = ([a-z]&!(a|e|i|o|u))
$vowels$ = a|e|i|o|u

%Define a rule that does not allow more than three consecutive non-vowel letters
$<4_consonants$ = ![a-z]*($non-vowels$$non-vowels$$non-vowels$($non-vowels$)+)[a-z]*

%Define a rule that does not allow more than two consecutive vowels
$<2_vowels$ = ![a-z]*($vowels$($vowels$)+)[a-z]*

um($<4_consonants$&$<2_vowels$)(a|e|i|o|u) |\		%1 related plural forms sometimes found in 2,4 and 6
ab(a|e)($<4_consonants$&$<2_vowels$)(a|e|i|o|u) |\	%2
u($<4_consonants$&$<2_vowels$)(a|e|i|o|u) |\		%1A
oo($<4_consonants$&$<2_vowels$)(a|e|i|o|u) |\		%2A
u(m)?($<4_consonants$&$<2_vowels$)(a|e|i|o|u) |\	%3
im(e|i)?($<4_consonants$&$<2_vowels$)(a|e|i|o|u) |\	%4
i(li)?($<4_consonants$&$<2_vowels$)(a|e|i|o|u) |\ 	%5
am(a)?($<4_consonants$&$<2_vowels$)(a|e|i|o|u) |\ 	%6
is(a|i)?($<4_consonants$&$<2_vowels$)(a|e|i|o|u) |\ 		%7
iz(a|i)?($<4_consonants$&$<2_vowels$)(a|e|i|o|u) |\ 		%8
i(n|m)?($<4_consonants$&$<2_vowels$)(a|e|i|o|u) |\ 		%9
i(i(n|m)?|zi(n|m))($<4_consonants$&$<2_vowels$)(a|e|i|o|u) |\ 	%10
u(l|lu|lw)?($<4_consonants$&$<2_vowels$)(a|e|i|o|u) |\ 		%11
u(b|bu|ty|tyw)?($<4_consonants$&$<2_vowels$)(a|e|i|o|u) |\ 	%14
uk(u|w)?($<4_consonants$&$<2_vowels$)a 				%15
