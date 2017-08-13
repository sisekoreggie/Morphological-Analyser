%Transducer of the suffixes for the verb roots, in terms of their tenses
$verb-reg-infl$ = <Verb>:<> (\
	{<present>}:{a} |\
	{<past>}:{ile} |\
	{<past>}:{anga} |\
	{<past>}:{e})

%Transducer of the prefixes for the verbs roots in terms of their tenses
$verb-pref$ = <Verb>:<> (\
	{<future>}:{ndizo} |\
	{<pasts>}:{ndiza} |\
	{<presents>}:{ndiya} |\
	{<pastAndPresent>}:{ndi} |\
	{<future>}:{ndiza ku})

$verb-pref-ndiza_ku$ = <Verb>:<> ({<future>}:{ndiza ku})
$verb-pref-ndiza$ = <Verb>:<> ({<past>}:{ndiza})
$verb-pref-ndizo$ = <Verb>:<> ({<future>}:{ndizo})
$verb-pref-ndiya$ = <Verb>:<> ({<present>}:{ndiya})
$verb-pref-ndi$ = <Verb>:<> ({<pastAndPresent>}:{ndi})
$verb-pref-uku$ = <Verb>:<> ({<isixando_sokwenzela>}:{uku})

$ndiza_ku$ = $verb-pref-ndiza_ku$ "verbs.txt"
$ndizo$ = $verb-pref-ndizo$ "verbs.txt"
$ndiza$ = $verb-pref-ndiza$ "verbs.txt"
$ndiya$ = $verb-pref-ndiya$ "verbs.txt"
$ndi$ = $verb-pref-ndi$ "verbs.txt"
$uku$ = $verb-pref-uku$ "verbs.txt"

%Define a rule that replaces a with empty string

%$remove_a$ = [a-z] a <=> <> (<> ^[a-z])
%$remove_a$ = [a-z][a-z] a <=> <> ({<>}:<> | ^[a-z]:<>)

%Define replace 'a' rule
ALPHABET = [A-Za-z] a:<>
$remove_a$ = {a}:{<>} ^-> (__ \$) 

%Define replace 'e' rule
ALPHABET = [A-Za-z] e:<>
$remove_e$ = {e}:{<>} ^-> (__ \$) 

%Define replace 'ile' rule
ALPHABET = [A-Za-z] {ile}:<>
$remove_ile$ = {ile}:{<>} ^-> (__ \$)

%Define replace 'anga' rule
ALPHABET = [A-Za-z] {anga}:<>
$remove_anga$ = {anga}:{<>} ^-> (__ \$)

%Define replace 'ela' rule
ALPHABET = [A-Za-z] {ela}:<>
$remove_ela$ = {ela}:{<>} ^-> (__ \$)

%Define replace 'elela' rule
ALPHABET = [A-Za-z] {elela}:<>
$remove_elela$ = {elela}:{<>} ^-> (__ \$)

%Define replace 'isa' rule
ALPHABET = [A-Za-z] {isa}:<>
$remove_isa$ = {isa}:{<>} ^-> (__ \$)

%Define replace 'isisa' rule
ALPHABET = [A-Za-z] {isisa}:<>
$remove_isisa$ = {isisa}:{<>} ^-> (__ \$)

%Define replace 'ana' rule
ALPHABET = [A-Za-z] {ana}:<>
$remove_ana$ = {ana}:{<>} ^-> (__ \$)

%$morph$ = $verb-pref$ "verbs.txt"

$ile$ = ^_$remove_ile$ 
$a$ = ^_$remove_a$ 
$e$ = ^_$remove_e$ 
$anga$ = ^_$remove_anga$ 
$ela$ = ^_$remove_ela$
$elela$ = ^_$remove_elela$
$isa$ = ^_$remove_isa$
$isisa$ = ^_$remove_isisa$
$ana$ = ^_$remove_ana$ 

%Calling all the rules which were define on top
($ndiza_ku$ || $a$) | ($ndizo$ || $a$) | ($ndiya$ || $a$) | ($ndi$ || $ile$) | ($ndi$ || $e$) | ($ndi$ || $a$) | ($uku$ || $ela$) | ($uku$ || $elela$) | ($uku$ || $isa$) | ($uku$ || $isisa$) | ($uku$ || $ana$)

%$remover$ = <> a <=> <> [a-z]*
%$remover$ "verbs.txt"

%$morph$ || $ile$ 

%$first_Rule$ = <>:a 
%$second_rule$ = <>:{ile}
%$third_rule$ = <>:{anga}
%$forth_rule$ = <>:e

%$replace$ = "verbs.txt" $second_rule$ | "verbs.txt" $third_rule$ | "verbs.txt" $first_Rule$ | "verbs.txt" $forth_rule$

%$morph$ = $verb-pref$ "verbs.txt" %| "verbs.txt" $verb-reg-infl$

%$replace$ %& $morph$

%^_$first_Rule$


%$R1$ %|| $morph$ 

%"verbs.txt" |\
%$morph$ = "verbs.txt" $verb-reg-infl$
%ALPHABET = [<Verb><pastAndPresent>]:<> [A-Za-z] a:<>
%$y-to-ie$ = e <=> <> (<Verb>:<> [ie]) %{Ndi}:{ie} ^-> (__ [<Verb>] )
%$morph$ || $y-to-ie$

