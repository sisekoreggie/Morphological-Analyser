%#LowerCase# = a-z
%#UpperCase# = A-Z
%"tester.txt" \
%[#UpperCase#]:[#LowerCase#]* |\
um[A-Z]?[a-z]*(a|e|i|o|u) |\		%1 related plural forms sometimes found in 2,4 and 6
ab(a|e)[A-Z]?[a-z]*(a|e|i|o|u) |\	%2
u[A-Z]?[a-z]*(a|e|i|o|u) |\		%1A
oo[A-Z]?[a-z]*(a|e|i|o|u) |\		%2A
u(m)?[A-Z]?[a-z]*(a|e|i|o|u) |\		%3
im(e|i)?[A-Z]?[a-z]*(a|e|i|o|u) |\	%4
i(li)?[a-z]*[a-z]*(a|e|i|o|u) |\ 	%5
am(a)?[A-Z]?[a-z]*[a-z]*(a|e|i|o|u) |\ 	%6
is(a|i)?[a-z]*(a|e|i|o|u) |\ 		%7
iz(a|i)?[a-z]*(a|e|i|o|u) |\ 		%8
i(n|m)?[a-z]*(a|e|i|o|u) |\ 		%9
i(i(n|m)?|zi(n|m))[a-z]*(a|e|i|o|u) |\ 	%10
u(l|lu|lw)?[a-z]*(a|e|i|o|u) |\ 	%11
u(b|bu|ty|tyw)?[a-z]*(a|e|i|o|u) |\ 	%14
uk(u|w)?[a-z]*a 			%15
