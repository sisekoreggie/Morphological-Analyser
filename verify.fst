%Transducer for izivumelanisi zentloko with vowels
$with-vowels$ = <>:<> (\
	{<>}:{ndi} | {<>}:{si} |\ %Umntu_I
	{<>}:{ku} | {<>}:{wu} | {<>}:{ni} |\ %Umntu_II
	{<>}:{u} | {<>}:{a} | {<>}:{ka} |\ %Ihlelo_1
	{<>}:{ba} | {<>}:{be} |\ %ihlelo_2
	{<>}:{u} | {<>}:{wu} |\ %ihlelo_3
	{<>}:{i} | {<>}:{yi} |\ %ihlelo_4
	{<>}:{li} |\ %ihlelo_5
	{<>}:{a} | {<>}:{ka} |\ %ihlelo_6
	{<>}:{si} |\ %ihlelo_7
	{<>}:{zi} |\ %ihlelo_8
	{<>}:{i} | {<>}:{yi} |\ %ihlelo_9
	{<>}:{zi} |\ %ihlelo_10
	{<>}:{lu} |\ %ihlelo_11
	{<>}:{bu} |\ %ihlelo_14
	{<>}:{ku} | {<>}:{kwa}) %ihlelo_15

%Transducer for izivumelanisi zentloko without vowels
$without-vowels$ = <>:<> (\
	{<>}:{nd} | {<>}:{s} |\ %Umntu_I
	{<>}:{w} | {<>}:{n} |\ %Umntu_II
	{<>}:{w} | {<>}:{k} | {<>}:{w} |\ %Ihlelo_1
	{<>}:{b} |\ %ihlelo_2
	{<>}:{w} |\ %ihlelo_3
	{<>}:{y} |\ %ihlelo_4
	{<>}:{l} |\ %ihlelo_5
	{<>}:{k} |\ %ihlelo_6
	{<>}:{s} |\ %ihlelo_7
	{<>}:{z} |\ %ihlelo_8
	{<>}:{y} |\ %ihlelo_9
	{<>}:{z} |\ %ihlelo_10
	{<>}:{l} |\ %ihlelo_11
	{<>}:{b} |\ %ihlelo_14
	{<>}:{k}) %ihlelo_15

%Transducer for izivumelanisi zenjongosenzi with vowels
$with-vowels-njongosenzi$ = <>:<> (\
	{<>}:{ndi} | {<>}:{si} |\ %Umntu_I
	{<>}:{ku} | {<>}:{ni} |\ %Umntu_II
	{<>}:{ba} |\ %ihlelo_2
	{<>}:{wu} |\ %ihlelo_3
	{<>}:{yi} |\ %ihlelo_4
	{<>}:{li} |\ %ihlelo_5
	{<>}:{wa} |\ %ihlelo_6
	{<>}:{si} |\ %ihlelo_7
	{<>}:{zi} |\ %ihlelo_8
	{<>}:{yi} |\ %ihlelo_9
	{<>}:{zi} |\ %ihlelo_10
	{<>}:{lu} |\ %ihlelo_11
	{<>}:{bu} |\ %ihlelo_14
	{<>}:{ku} | {<>}:{kwa}) %ihlelo_15

%Transducer for izivumelanisi zenjongosenzi without vowels
$without-vowels-njongosenzi$ = <>:<> (\
	{<>}:{nd} | {<>}:{s} |\ %Umntu_I
	{<>}:{k} | {<>}:{n} |\ %Umntu_II
	{<>}:{m} |\ %Ihlelo_1
	{<>}:{w} |\ %ihlelo_3
	{<>}:{y} |\ %ihlelo_4
	{<>}:{l} |\ %ihlelo_5
	{<>}:{w} |\ %ihlelo_6
	{<>}:{s} |\ %ihlelo_7
	{<>}:{z} |\ %ihlelo_8
	{<>}:{y} |\ %ihlelo_9
	{<>}:{z} |\ %ihlelo_10
	{<>}:{l} |\ %ihlelo_11
	{<>}:{b} |\ %ihlelo_14
	{<>}:{k}) %ihlelo_15

%Transducer for izimaphambili zoguquguqulo
$phambi-kwesentloko$ = <>:<> (\
	{<>}:{kha} |\
	{<>}:{khe} |\
	{<>}:{se} |\
	{<>}:{be} |\
	{<>}:{ze} |\
	{<>}:{ma})

$emva-kwesentloko$ = <>:<> (\
	{<>}:{nga} |\
	{<>}:{nge} |\
	{<>}:{ya} |\
	{<>}:{sa} |\
	{<>}:{ka})

%Transducer for isimaphambili soguquguqulo that starts with a vowel
$isikhamiso$ = <>:<> ({<>}:{a})

%Transducer for isimaphambili: isakhi sokuzenza u 'zi'
$zi$ = <>:<> ({<>}:{zi})

%Rule for removing the suffixes for izixando
$remove$ = <>:{wa} | <>:{we} | <>:{iwe} | <>:{aneka} | <>:{iseka} | <>:{eleka} | <>:{ekekeka} | <>:{ekeka} | <>:{akala} | <>:{eka} | <>:{isana} | <>:{elana} | <>:{elelana} | <>:{ana} | <>:{olo} | <>:{ela} | <>:{ele} | <>:{la} | <>:{ya} | <>:{za} | <>:{sa} | <>:{esa} | <>:{isa}

%Repeating suffixes for izixando
$repeated$ = ((<>:{el})+<>:{a}) | ((<>:{el})+<>:{e}) | ((<>:{is})+<>:{a}) | ((<>:{is})+<>:{e}) 

$remove$ = $remove$ | $repeated$

%| <>:{ene} | <>:{anwa} | <>:{enwe}
%Rule for removing suffixes zexesha elidlulileyo kwizivumo nakwizilandulo
$elidlulileyo$ = <>:{ile} | <>:{anga} | <>:{a} 

%Isimamva sesininzi kwisiyaleli
$ni$ = <>:{ni}

%Isimamva sesibaluli
$yo$ = <>:{yo}

%Isigqibelo sesilanduli
$remove_i$ = <>:{i}

%Ezinye izimamva
$final$ = <>:{ula} | <>:{ulula} | <>:{uluka} | <>:{ama} | <>:{ma} | <>:{atha} | <>:{tha} | <>:{ala} | <>:{alala} | <>:{nga} | <>:{zela} | <>:{ba} | <>:{pha} | <>:{leza} | <>:{ka} | <>:{da} | <>:{ta} | <>:{sha} | <>:{za} | <>:{bala}

$intloko-enesikhamiso$ = ($phambi-kwesentloko$$with-vowels$ | $with-vowels$$emva-kwesentloko$ | $with-vowels$) 
$intloko-engenasikhamiso$ = $without-vowels$$isikhamiso$ | $isikhamiso$

$injongosenzi$ = $with-vowels-njongosenzi$$zi$ | $with-vowels-njongosenzi$  

$vowel-starting-verbs$ = $intloko-engenasikhamiso$$without-vowels-njongosenzi$ | $intloko-enesikhamiso$$without-vowels-njongosenzi$ | $without-vowels$ | $without-vowels-njongosenzi$

(($intloko-enesikhamiso$ | $intloko-engenasikhamiso$)? ($injongosenzi$)? "verbs.txt" ($remove$ | $elidlulileyo$ | $ni$ | $yo$ | $remove_i$ | $final$)) | ($vowel-starting-verbs$ "verbs-vowel.txt" ($remove$ | $elidlulileyo$ | $ni$ | $yo$ | $remove_i$ | $final$))


