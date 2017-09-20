%isibizo1+isibizo2 = pref1+root1+suffix1
ALPHABET = [a-z]
$non-vowels$ = ([a-z]&!(a|e|i|o|u))
$vowels$ = a|e|i|o|u

%Define a rule that does not allow more than three consecutive non-vowel letters
$<4_consonants$ = ![a-z]*($non-vowels$$non-vowels$$non-vowels$($non-vowels$)+)[a-z]*

%Define a rule that does not allow more than two consecutive vowels
$<2_vowels$ = ![a-z]*($vowels$($vowels$)+)[a-z]*

$r$ = um($<4_consonants$&$<2_vowels$)($non-vowels$)(a|e|i|o|u)
$k$ = m($<4_consonants$&$<2_vowels$)(a|e|i|o|u)

$r$$k$


%ALPHABET = [A-Za-z] u:<> 
%$delete_u$ = <> u <=> <> ([a-z])

%$a$ = "<tester.a>"

%($a$ ($a$ || ($delete_u$)))

%^_($a$ (({<>}:{u})) $a$)

%isibizo+isimelabizo: Remove the ending 'na' in isimelabizo zoqobo
%$esoqobo$ = <>:<> ({<>}:{m} | {<>}:{we}| {<>}:{thi} | {<>}:{ni} | {<>}:{yo} | {<>}:{so} | {<>}:{zo} | {<>}:{lo} |\
		%{<>}:{bo} | {<>}:{wo} | {<>}:{ko} | {<>}:{ye} | {<>}:{bo} | {<>}:{lo} | {<>}:{wo})

%"<tester.a>" $esoqobo$

%isibizo+isichazi
%ALPHABET = [A-Za-z] u:i %[<Verb><Noun> e]:<> y:i
%$delete-e$ = <> u <=> i ([a-z])

%(^_$delete-e$) ("<tester.a>" "iziphawuli.txt") 
