# update at 2016.11 
BEGIN {
	FS="[:| ]"
}
/^掲載日/{
	++works[$2]
}
END {
	for (d in works) {
    	    # print d "\t" works[d]
    	    printf("%s %s", d, "\t")
            for (i = 0; i < works[d]; i++) {
                printf("*")
            }
            printf("\n")
	}
}
