%Remote Past Tense: Positive page 75 of Speak Xhosa with us beginner to advanced
%Positive:  sc + a + (oc) + root + a
%negative:  sc + (oc) + root + e

$p_t_c_a$ = <>:<>({<>}:{nda} | {<>}:{sa} |\   %first person and 7
		 {<>}:{wa} | {<>}:{na} |\     %second person
		 {<>}:{wa} |\     	      %1/1a and 3
		 {<>}:{ba} |\      	      %2/2a
		 {<>}:{ya}  |\      	      %4 and 9
		 {<>}:{la} |\     	      %5
		 {<>}:{a} |\      	      %6
		 {<>}:{za} |\     	      %8 and 10
		 {<>}:{lwa} |\    	      %11
		 {<>}:{ba} |\     	      %14
		 {<>}:{kwa})      	      %15

$p_t_c_e$ = <>:<>({<>}:{ndi} | {<>}:{si} |\   %first person and 7
		 {<>}:{u} | {<>}:{ni} |\      %second person and 3
		 {<>}:{a} |\      	      %1/1a and 6
		 {<>}:{ba} |\      	      %2/2a
		 {<>}:{wa} | {<>}:{u} |\      %3
		 {<>}:{i} |\      	      %4 and 9
		 {<>}:{li} |\     	      %5
		 {<>}:{zi} |\     	      %8 and 10
		 {<>}:{lu} |\    	      %11
		 {<>}:{bu} |\     	      %14
		 {<>}:{ku})                   %15

$rm_e$ = <>:{e}				%Remove 'e' the final vowel of the verb		   

%===============================================================================
\
%Present Tense: Positive page 27 of Speak Xhosa with us beginner to advanced
%Long form when nothing follows the verb:  subject_concords + ya + root + a
%Short form when something follows the verb:  subject_concords + root + a

%Past Tense: Negative
% a + subject_concords + root + i

%Subject Concords for verbs in positive present tense
$sc_p$ = <>:<> (\
		  {<>}:{u} |\ 		%class 1a nd 1
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

$sc_ya$ = <>:<> ({<>}:{ya})             %The added ya for long form
$rm_a$ = <>:{a}				%Remove 'a' the final vowel of the verb

%Subject Concords for verbs in negative present tense
$sc_n$ = <>:<> (\
		{<>}:{aka} |\
		{<>}:{aba} |\
		{<>}:{awu} |\
		{<>}:{ayi} |\
		{<>}:{ali} |\
		{<>}:{aka} |\
		{<>}:{asi} |\
		{<>}:{azi} |\
		{<>}:{alu} |\
		{<>}:{abu} |\
		{<>}:{aku})

$rm_i$ = <>:{i}				%Remove 'i' the final vowel of the verb

%Object concords (oc)
%These are given by the formula: sc+ya+oc+root+a
$oc$ = <>:<> ({<>}:{m} |\
	      {<>}:{ba} |\
	      {<>}:{si} |\
	      {<>}:{li} |\
	      {<>}:{wu} |\
	      {<>}:{yi} |\
	      {<>}:{ndi} |\  %
	      {<>}:{ku} |\
	      {<>}:{ni} |\
	      {<>}:{wa} |\
	      {<>}:{zi} |\
	      {<>}:{lu} |\
	      {<>}:{bu})

%These are the object concords that are mixed with verbs starting with a vowel
$oc_vowel$ = <>:<> ({<>}:{kw} |\
	      {<>}:{b} |\
	      {<>}:{s} |\
	      {<>}:{l} |\
	      {<>}:{w} |\
	      {<>}:{y} |\
	      {<>}:{nd} |\  %
	      {<>}:{k} |\
	      {<>}:{n} |\
	      {<>}:{w} |\
	      {<>}:{z} |\
	      {<>}:{l} |\
	      {<>}:{b})

%Simple comands with object concords
%Positive: oc+root+e
%Negative: musa + uku+oc+root+a
$neg_comm$ = <>:<>({<>}:{uku}) 

%===============================================================================

%Future Tense
%these are future tense rules in speech forms
%Positive: sc+zo+ku+root+a or sc+o+root+a
%Negative: a+sc+zu+ku+root+a or a+sc+zu+root+a

$fut_sc_p$ = <>:<>({<>}:{nd} | {<>}:{s} |\   
		 {<>}:{n} |\     
		 {<>}:{b} |\      	      
		 {<>}:{w} |\      		    	      
		 {<>}:{z} |\     	      
		 {<>}:{l} |\    	         	      
		 {<>}:{k})

$fut_sc$ = <>:<>({<>}:{ndi} | {<>}:{si} |\   
		 {<>}:{ni} |\     
		 {<>}:{ba} |\      	      
		 {<>}:{wa} |\      		
		 {<>}:{li} |\     	      
		 {<>}:{zi} |\     	      
		 {<>}:{lu} |\    	     
		 {<>}:{bu} |\     	      
		 {<>}:{ku}) 

$middle_o$ = <>:<> ({<>}:{o})
$zoku$ = <>:<> ({<>}:{zoku})                  

$front_a$ = <>:<> ({<>}:{a})
$fut_neg$ = <>:<> ({<>}:{zuku} | {<>}:{zu})

%===============================================================================

%The Past Subjunctive Mood

$past_subj$ = <>:<>({<>}:{anda} | {<>}:{ana} | {<>}:{anda} | {<>}:{ala} | {<>}:{aza} | {<>}:{alwa})
%===============================================================================

%Direct Relative Clauses
%Positive: relSC+oc+root+a+yo or relSC+oc+root+a
%Negative: relSC+nga+oc+root+i+yo or relSC+nga+oc+root+i

%===============================================================================

%Transducer for subjects concords that end with vowels
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

%Transducer for subjects concords that end without vowels
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
$ni$ = <>:{ni} | <>:{ani} | <>:{eni}

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


($past_subj$ "verbs.txt" $rm_a$) |\		%The Past Subjunctive Mood
($fut_sc$ $zoku$ "verbs.txt" $rm_a$) | ($fut_sc_p$ $middle_o$ "verbs.txt" $rm_a$) |\  %Positive Future Tense
($front_a$ $fut_sc$ $fut_neg$ "verbs.txt" $rm_a$) |\   %Negative Future Tense
($neg_comm$$oc$ "verbs.txt" $rm_a$) | ($oc$ "verbs.txt" $rm_e$) |\  %Simple comands with object concords
(($p_t_c_a$ "verbs.txt" $rm_a$) | ($p_t_c_e$ "verbs.txt" $rm_e$)) |\
($sc_n$ ($oc_vowel$)? "verbs.txt" $rm_i$) | ($sc_p$ ($sc_ya$|$sc_ya$$oc$)? "verbs.txt" $rm_a$) |\ %the following are the ones which come from the verbs2 file
(($intloko-enesikhamiso$ | $intloko-engenasikhamiso$)? ($injongosenzi$)? "verbs.txt" ($remove$ | $elidlulileyo$ | $ni$ | $yo$ | $remove_i$ | $final$)) | ($vowel-starting-verbs$ "verbs-vowel.txt" ($remove$ | $elidlulileyo$ | $ni$ | $yo$ | $remove_i$ | $final$))











