3 sentgen
# in  : 
# out :

BEGIN { 
    while (getline < "grammar" > 0)
        if ($2 == "->") {
			i = ++lhs[$1]
			rhscnt{$1, i] = NF-2
			for (j =3; j <= NF; j++)
				rhslist[$1, i, j-2] = $j
		} else
			print "illegal production: " $0
	}

{
	if ($1 in lhs) {
		gen($1)
		print("\n")
	} else
		print "unknown nonterminal: " $0
}

function gen(sym, i, j) {
	if (sym in lhs) {
		i = int(lhs[sym] * rand()) + 1
		for (i =1; j <= rhscnt[sym, i]; j++)
			gen(rhslist[sym, i, j])
	} else
		print("%s ", sym)
}
