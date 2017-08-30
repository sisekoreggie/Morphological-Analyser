%Iziphawuli
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

%$izibaluli$ = ($isv-esongezelelweyo$ | $isv-sentsusa$ | $nga$) "iziphawuli.txt"

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

%Ubume obungafezekanga
$bu$ = <>:<> ({<>}:{bu})
$sabu$ = <>:<> ({<>}:{sabu})
$rha$ = <>:{rha}

%(($isv-sentsusa-baluli$ | $isv-esongezelelweyo-baluli$) "izibaluli.txt") | (($isv-sentsusa-baluli$$bu$ | $sabu$ | $bu$) "izibaluli.txt" )

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

%$isv-sentsusa-mnini$$isimn-soqobo$

%izimnini ezakhiwe kwisimelabizo sokwalatha
%"izimnini_zokwalatha.txt"

%Izimnini ezakhiwe kwizimelabizo zoquko
$izimnini-zoquko$ = <>:<> (\
	{<>}:{dwa} |\
	{<>}:{nke})

%$isv-sentsusa-mnini$$izimnini-zoquko$

%Izimnini ezakhiwe kwiziphawuli
%$isv-sentsusa-mnini$ "iziphawuli.txt"

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

$1a_and_2a$($<4_consonants$&$<2_vowels$)(a|e|i|o|u)



%Izichazi Zokukumbi
$mbi-phi$ = <>:<> (\
	{<>}:{mbi} |\
	{<>}:{phi})

$isv-sentsusa-baluli$$mbi-phi$ %izivumelanisi zika mbi no phi zifana nqwa nezezibaluli

$nye-ni$ = <>:<> (\
	{<>}:{nye} |\
	{<>}:{ni})

$issv-sentsusa$$nye-ni$ %izivumelanisi zika nye no ni zifana nqwa nezeziphawuli










