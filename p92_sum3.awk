# sum3 -
# in  : Row containing integer or character string
# out : Total number of columns containing numbers
#   Suppose that all rows have the same sequence.

NR == 1 { nfld = NF
	for (i =1; i <= NF; i++)
		numcol[i] = isnum($i)
	}
	{ for (i =1; i <= NF; i++)
		if (numcol[i])
			sum[i] += $i
	}
END	{ for (i =1; i <= nfld; i++) {
		if (numcol[i])
			printf("%g", sum[i])
		else
			print("--")
		printf(i < nfld ? "\t" : "\n")
	  }
	}

function isnum(n) { return n ~ /^[+-]?[0-9]+$/ }
