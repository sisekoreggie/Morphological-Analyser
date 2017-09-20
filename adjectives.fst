%Iziphawuli
%Iziphawuli are called adjectives and their prefixes are called 'adjective concords'
%Descriptive corpulative concords
$issv-sentsusa$ = <>:<> (\
	{<>}:{m} |\
	{<>}:{ba} |\
	{<>}:{m} |\
	{<>}:{mi} |\
	{<>}:{li} |\
	{<>}:{ma} |\
	{<>}:{si} |\
	{<>}:{zi} |\
	{<>}:{in} |\
	{<>}:{zin} |\
	{<>}:{lu} |\
	{<>}:{bu} |\
	{<>}:{ku})

%noun prefix when combined with 'a' they become the following 'adjective concords'
$isv-esongezelelweyo$ = <>:<> (\
	{<>}:{om} |\
	{<>}:{aba} |\
	{<>}:{om} |\
	{<>}:{emi} |\
	{<>}:{eli} |\
	{<>}:{ama} |\
	{<>}:{esi} |\
	{<>}:{ezi} |\
	{<>}:{en} |\
	{<>}:{ezin} |\
	{<>}:{olu} |\
	{<>}:{obu} |\
	{<>}:{oku})

$nga$ = <>:<> ({<>}:{nga})

%Izibaluli
$isv-sentsusa-baluli$ = <>:<> (\
	{<>}:{ndi} | {<>}:{si} |\ %Umntu_I
	{<>}:{u} | {<>}:{ni} |\ %Umntu_II
	{<>}:{u} |\ %Ihlelo_1
	{<>}:{ba} |\ %ihlelo_2
	{<>}:{u} |\ %ihlelo_3
	{<>}:{i} |\ %ihlelo_4
	{<>}:{li} |\ %ihlelo_5
	{<>}:{a} |\ %ihlelo_6
	{<>}:{si} |\ %ihlelo_7
	{<>}:{zi} |\ %ihlelo_8
	{<>}:{i} |\ %ihlelo_9
	{<>}:{zi} |\ %ihlelo_10
	{<>}:{lu} |\ %ihlelo_11
	{<>}:{bu} |\ %ihlelo_14
	{<>}:{ku}) %ihlelo_15

$isv-esongezelelweyo-baluli$ = <>:<> (\
	{<>}:{endi} | {<>}:{esi} |\ %Umntu_I
	{<>}:{o} | {<>}:{eni} |\ %Umntu_II
	{<>}:{o} |\ %Ihlelo_1
	{<>}:{aba} |\ %ihlelo_2
	{<>}:{o} |\ %ihlelo_3
	{<>}:{e} |\ %ihlelo_4
	{<>}:{eli} |\ %ihlelo_5
	{<>}:{a} |\ %ihlelo_6
	{<>}:{esi} |\ %ihlelo_7
	{<>}:{ezi} |\ %ihlelo_8
	{<>}:{e} |\ %ihlelo_9
	{<>}:{ezi} |\ %ihlelo_10
	{<>}:{olu} |\ %ihlelo_11
	{<>}:{obu} |\ %ihlelo_14
	{<>}:{oku}) %ihlelo_15

$nga-nge$ = <>:<> ({<>}:{nga} | {<>}:{nge})

%Ubume obungafezekanga
$bu$ = <>:<> ({<>}:{bu})
$sabu$ = <>:<> ({<>}:{sabu})
$rha$ = <>:{rha}

%Izimnini
$1a_and_2a$ = <>:<> (\
	{<>}:{ka} |\ 
	{<>}:{baka} |\ 
	{<>}:{lika} |\ 
	{<>}:{sika} |\ 
	{<>}:{zika} |\ 
	{<>}:{luka} |\ 
	{<>}:{buka} |\ 
	{<>}:{kuka}) 

$isv-sentsusa-mnini$ = <>:<> (\
	{<>}:{wa} |\ %Ihlelo_1
	{<>}:{ba} |\ %ihlelo_2
	{<>}:{wa} |\ %ihlelo_3
	{<>}:{ya} |\ %ihlelo_4
	{<>}:{la} |\ %ihlelo_5
	{<>}:{a} |\ %ihlelo_6
	{<>}:{sa} |\ %ihlelo_7
	{<>}:{za} |\ %ihlelo_8
	{<>}:{ya} |\ %ihlelo_9
	{<>}:{za} |\ %ihlelo_10
	{<>}:{lwa} |\ %ihlelo_11
	{<>}:{ba} |\ %ihlelo_14
	{<>}:{kwa}) %ihlelo_15

%Iziqu zobunini ezakhiwe kwizimelabizo zoqobo
$isimn-soqobo$ = <>:<>  (\
	{<>}:{m} |\
	{<>}:{khe} |\
	{<>}:{bo} |\
	{<>}:{wo} |\
	{<>}:{yo} |\
	{<>}:{lo} |\
	{<>}:{so} |\
	{<>}:{zo} |\
	{<>}:{ko})

$isimn-soqobo-b$ = <>:<>  (\
	{<>}:{ithu} |\
	{<>}:{ikho} |\
	{<>}:{inu})

%izimnini ezakhiwe kwisimelabizo sokwalatha
%"izimnini_zokwalatha.txt"

%Izimnini ezakhiwe kwizimelabizo zoquko
$izimnini-zoquko$ = <>:<> (\
	{<>}:{dwa} |\
	{<>}:{nke})

%Izimnini ezakhiwe kwizimnini e.g wesamadoda, kweyezikolo
%$isv-sentsusa-mnini$+ isimnini

%recognising izimnini zezibizo zika class 1a and 2a
ALPHABET = [a-z]
$non-vowels$ = ([a-z]&!(a|e|i|o|u))
$vowels$ = a|e|i|o|u

%Define a rule that does not allow more than three consecutive non-vowel letters
$<4_consonants$ = ![a-z]*($non-vowels$$non-vowels$$non-vowels$($non-vowels$)+)[a-z]*

%Define a rule that does not allow more than two consecutive vowels
$<2_vowels$ = ![a-z]*($vowels$($vowels$)+)[a-z]*

%Izichazi Zokukumbi
$mbi-phi$ = <>:<> (\
	{<>}:{mbi} |\
	{<>}:{phi})

%These are sometimes izimaphambili for amahlelo abuthakatha
$abuthakathaka$ = <>:<> (\
	{<>}:{yi} |\
	{<>}:{wu} |\
	{<>}:{wa})

$nye-ni$ = <>:<> (\
	{<>}:{nye} |\
	{<>}:{ni})

%Izichazi Zoquko
$dwa-nke$ = <>:<> (\
	{<>}:{dwa} |\
	{<>}:{nke})

$zoquko$ = <>:<> ({<>}:{so} | {<>}:{bo} | {<>}:{zo} | {<>}:{ko})

(($isv-esongezelelweyo$ | $issv-sentsusa$ | $nga$) "iziphawuli.txt") |\
 (((($isv-sentsusa-baluli$($nga-nge$)?) | $isv-esongezelelweyo-baluli$)? "izibaluliiziphawuli.txt") | (($isv-sentsusa-baluli$$bu$ | $sabu$ | $bu$) "izibaluli.txt")) |\
(($isv-sentsusa-mnini$$isimn-soqobo$) | ($isv-sentsusa-mnini$$izimnini-zoquko$) | ($isv-sentsusa-mnini$ "iziphawuli.txt") | $1a_and_2a$($<4_consonants$&$<2_vowels$)(a|e|i|o|u)) |\
((($abuthakathaka$ | $isv-sentsusa-baluli$)$mbi-phi$) | ($issv-sentsusa$$nye-ni$)) |\
$zoquko$$dwa-nke$











