%New file
"<verify.a>" | "<adjectives.a>" | "<tester.a>"

%ALPHABET = [a-z]
%$non-vowels$ = ([a-z]&!(a|e|i|o|u))
%$vowels$ = a|e|i|o|u

%(($vowels$?)($non-vowels$($non-vowels$?($non-vowels$?))))+
%$<4_consonants$ = ![a-z]*($non-vowels$$non-vowels$$non-vowels$($non-vowels$)+)[a-z]*
%$<2_vowels$ = ![a-z]*($vowels$($vowels$)+)[a-z]*

%$<2_vowels$ "verbs.txt"
%um[A-Z]?($<4_consonants$&$<2_vowels$)(a|e|i|o|u)

%($kk$)*
%um(($kk$(($kk$)?$kk$)?)?)(a|e|i|o|u)*(($kk$(($kk$)?$kk$)?)?)(a|e|i|o|u)
