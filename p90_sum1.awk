# sum1
# in : A row of numbers
# out: Total for each column
# 	When there is no column, treat it as zero.

{ for (i =1; i < NF; i++)
	sum[i] += $i
  if (NF > maxfld)
	maxfld = NF
}
END { for (i=1; i <+ maxfld; i++) {
	printf("%d", sum[i])
	if (i < maxfld)
		printf("\t")
	else
		printf("\n")
	}
    }
