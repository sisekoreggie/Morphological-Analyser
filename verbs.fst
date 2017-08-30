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

%Transducer for izivumelanisi zentloko
$izivumelanisi-zentloko$ = <Verb>:<> (\
	{<umntu_I>}:{ndi} | {<umntu_I>}:{nd} | {<umntu_I>}:{si} | {<umntu_I>}:{s} |\
	{<umntu_II>}:{ku} | {<umntu_II>}:{wu} | {<umntu_II>}:{ni} | {<umntu_II>}:{w} | {<umntu_II>}:{n} |\
	{<ihlelo_1>}:{u} | {<ihlelo_1>}:{w} | {<ihlelo_1>}:{a} | {<ihlelo_1>}:{ka} | {<ihlelo_1>}:{k} | {<ihlelo_1>}:{w} |\
	{<ihlelo_2>}:{ba} | {<ihlelo_2>}:{be} | {<ihlelo_2>}:{b} |\
	{<ihlelo_3>}:{u} | {<ihlelo_3>}:{wu} | {<ihlelo_3>}:{w} |\
	{<ihlelo_4>}:{i} | {<ihlelo_4>}:{yi} | {<ihlelo_4>}:{y} |\
	{<ihlelo_5>}:{li} | {<ihlelo_5>}:{l} |\
	{<ihlelo_6>}:{a} | {<ihlelo_6>}:{ka} | {<ihlelo_6>}:{k} |\
	{<ihlelo_7>}:{si} | {<ihlelo_7>}:{s} |\
	{<ihlelo_8>}:{zi} | {<ihlelo_8>}:{z} |\
	{<ihlelo_9>}:{i} | {<ihlelo_9>}:{yi} | {<ihlelo_9>}:{y} |\
	{<ihlelo_10>}:{zi} | {<ihlelo_10>}:{z} |\
	{<ihlelo_11>}:{lu} | {<ihlelo_11>}:{l} |\
	{<ihlelo_14>}:{bu} | {<ihlelo_14>}:{b} |\
	{<ihlelo_15>}:{ku} | {<ihlelo_15>}:{k} | {<ihlelo_15>}:{kwa})

ALPHABET = [a-z]
$not_a$ = !(o|a|e|i|u)

$verb-pref-ndiza_ku$ = <Verb>:<> ({<future>}:{ndizaku})
$verb-pref-ndiza$ = <Verb>:<> ({<past>}:{ndiza})
$verb-pref-ndizo$ = <Verb>:<> ({<future>}:{ndizo})
$verb-pref-ndiya$ = <Verb>:<> ({<present>}:{ndiya})
$verb-pref-ndi$ = <Verb>:<> ({<pastAndPresent>}:{ndi})
$verb-pref-uku$ = <Verb>:<> ({<izixando>}:{uku})
$verb-pref-baya$ = <Verb>:<> ({<isixando>}:{baya})

$ndiza_ku$ = ($verb-pref-ndiza_ku$ || $not_a$) ("verbs.txt" & !"verbs-vowel.txt")
$ndizo$ = ($verb-pref-ndizo$$not_a$) ("verbs.txt" & !"verbs-vowel.txt")
$ndiza$ = ($verb-pref-ndiza$$not_a$) ("verbs.txt" & !"verbs-vowel.txt")
$ndiya$ = ($verb-pref-ndiya$$not_a$) ("verbs.txt" & !"verbs-vowel.txt")
$ndi$ = ($verb-pref-ndi$ || $not_a$) ("verbs.txt" & !"verbs-vowel.txt")
$uku$ = ($verb-pref-uku$ || $not_a$) ("verbs.txt" & !"verbs-vowel.txt")
$baya$ = ($verb-pref-baya$ || $not_a$) ("verbs.txt" & !"verbs-vowel.txt")

%Define a rule that replaces a with empty string

%$remove_a$ = [a-z] a <=> <> (<> ^[a-z])
%$remove_a$ = [a-z][a-z] a <=> <> ({<>}:<> | ^[a-z]:<>)

%Define replace 'a' rule
ALPHABET = [A-Za-z] a:<>
$remove_a$ = {a}:{<>} ^-> (__ \$) 

%Define replace 'e' rule (ixesha elidluleyo)
ALPHABET = [A-Za-z] e:<>
$remove_e$ = {e}:{<>} ^-> (__ \$) 

%Define replace 'ile' rule (ixesha elidluleyo)
ALPHABET = [A-Za-z] {ile}:<>
$remove_ile$ = {ile}:{<>} ^-> (__ \$)

%Define replace 'anga' rule (ixesha elidluleyo)
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

%Define replace 'eka' rule
ALPHABET = [A-Za-z] {eka}:<>
$remove_eka$ = {eka}:{<>} ^-> (__ \$)

%Isixando Sokwenziwa
%Define replace 'wa' and 'we' rule
ALPHABET = [A-Za-z] {iwa}:<>
$remove_wa$ = {iwa}:{<>} ^-> (__ \$)

ALPHABET = [A-Za-z] {wa}:<>
$remove_wa$ = {wa}:{<>} ^-> (__ \$)

ALPHABET = [A-Za-z] {we}:<>
$remove_wa$ = {we}:{<>} ^-> (__ \$)

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
$eka$ = ^_$remove_eka$
$wa$ = ^_$remove_wa$

%$kk$ = ([a-z]&!(a|e|i|o|u))
%$ndizo$ = $verb-pref-ndizo$ $kk$ || "verbs.txt"
%($ndizo$ || $a$) 

ALPHABET = [a-z]
$not_a$ = !i

$verb-pref$$izivumelanisi-zentloko$ "verbs.txt"

%Calling all the rules which were define on top
%($ndiza_ku$ || $a$) | ($ndizo$ || $a$) | ($ndiya$ || $a$) | ($ndi$ || $ile$) | ($ndi$ || $e$) | ($ndi$ || $a$) | ($uku$ || $ela$) | ($uku$ || $elela$) | ($uku$ || $isa$) | ($uku$ || $isisa$) | ($uku$ || $ana$) | ($uku$ || $eka$) | ($uku$ || $wa$) | ($baya$ || $a$) | ($baya$ || $ana$)

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

