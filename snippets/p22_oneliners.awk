# 1. Print the total number of input lines.
END { print NR}

# 2. Print the input line of line 10.
NR == 10

# 3. Print the last column of all input lines.
{print $NF}

# 4. Print the last column of the last line.
	{ field = $NF }
END	{ print field }

# 5. Print all input lines with more than 4 columns.
NF > 4

# 6. Print all input lines with more than 4 columns.
$NF > 4

# 7. Print the total number of all input line columns.
	{ nf = nf + NF }
END 	{ print nf }

# 8. Print the total number of lines including Beth.
/Beth/	{nlines = nlines + 1 }
END { print nf }

# 9. Print the largest first column and the line containing it.
$1 > max { max = $1; maxline = $0 }
END	{ print max; maxline }

# 10. Print all lines with at least one column.
NF > 0

# 11. Print all lines with a length longer than 80 characters.
length($0) > 80

# 12. Print the number of columns in each row and the line itself.
{ print NF, $0 }

# 13. Print the first two columns of any line in reverse order.
{ print $2,$1 }

# 14. Replace the first column of all lines with the line number and print.
{ temp = $1; $1 = $2; $2 = temp; print }

# 15. Erase and print the second column of all the lines.
{ $1 = NR; print }

# 16. Print all rows in reverse order.
{ $2 = ""; print }

# 17. Print the sum of each column of all the lines
{ for (i = NF; i > 0; i = i -1) print("%s "' $i)
	print("\n")
}

# 18. Total all the columns of all rows and print their values.
{ sum = 0
	for (i = 1; i < NF; i = i +1) sum = sum + $i
	print sum
}

# 19. Replace the values in each column with absolute values and print on all the lines.
{ for (i = 1; i < NF; i =  + 1) if ($i < 0) $i = -$i
	print
}
# 20.
