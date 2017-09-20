%Possesives: Page 23 of Speak Xhosa with us beginner to advanced
$p_concord$ = <>:<> (\
		  {<>}:{wa} |\ 		%class 1a, 1 and 3
		  {<>}:{ba} |\ 		%class 2a and 2
		  {<>}:{ya} |\ 		%class 4 and 9
		  {<>}:{la} |\ 		%class 5
		  {<>}:{a} |\		%class 6
		  {<>}:{sa} |\		%class 7
		  {<>}:{za} |\	 	%class 8 and 10
		  {<>}:{lwa} |\ 	%class 11
		  {<>}:{ba} |\ 		%class 14
		  {<>}:{kwa}) 		%class 15

$p_stems1$ = <>:<> ({<>}:{m} | {<>}:{kho} | {<>}:{khe} | {<>}:{bo})

$possessives$ = <>:<> (\
		  {<>}:{wethu}  | {<>}:{wenu} |\ 	%class 1a, 1 and 3
		  {<>}:{bethu} | {<>}:{benu}|\ 		%class 2a and 2
		  {<>}:{yethu} | {<>}:{yethu}|\ 	%class 4 and 9
		  {<>}:{lethu} | {<>}:{lenu} |\ 	%class 5
		  {<>}:{ethu} | {<>}:{enu} |\		%class 6
		  {<>}:{sethu} | {<>}:{senu} |\		%class 7
		  {<>}:{zethu} | {<>}:{zenu} |\	 	%class 8 and 10
		  {<>}:{lwethu} | {<>}:{lwenu} |\ 	%class 11
		  {<>}:{bethu} | {<>}:{benu} |\ 	%class 14
		  {<>}:{kwethu} | {<>}:{kwenu}) 	%class 15

%Posessive pronouns
$pos_pro_y$ = <>:<> ({<>}:{yam})
$pos_pro$ = <>:<> ({<>}:{bam} | {<>}:{wam} | {<>}:{wethu} | {<>}:{wabo})

%posessive pronoun prefixes
$pos_pref$ = <>:<> ({<>}:{a} | {<>}:{o})
$pos_pref_e$ = <>:<> ({<>}:{e})

%Corpulatives with possessive pronouns
%$pr$ = <>:<> ({<>}:{ye} | {<>}:{le} | {<>}:{bo} | {<>}:{se} | {<>}:{ze} | {<>}:{ko})


($pos_pref$$pos_pro$ | $pos_pref_e$$pos_pro_y$) |\ %Posessive pronouns
$possessives$ | $p_concord$$p_stems1$










































