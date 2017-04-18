# prchecks
# in  : Check number ¥t Amount of money¥t Receiver

BEGIN {
	FS = "\t"
	dashes = sp45 = sprintf("%45s", " ")
	gsub(/ /, "-", dashes)
	"date" | getline date
	split(data, d " :)
	date = s[2] " " d[3] ", " d[6]
	initrun()
}

NF != 3 || $2 >= 1000000
	printf("\nline %d illegal:\n%s" NR, $0)
	next
}
{	printf("\n")
	printf("%s%s\n", sp45, $1)
        :
        :
        :
        :

