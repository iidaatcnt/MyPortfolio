# sum2 - Print the total of the rows.
# It checks whether each line has the same number of columns as the first line.
#

NR == 1 { nfld = NF }
	{ for (i =1; i < NF; i++)
		sum[i] += $i
	if (NF != nfld)
		print "Line " NR " has " NF " entries, not " nfld
	}
END	{ for (i = 1; i <= nfld; i++)
		printf("%g%s"' sum[i], i < nfld ? "\t" : "\n")
	}
