# update at 2016.11 
BEGIN {
	FS="[:| ]"
}
/掲載日/{
        #match($0,/掲載日:[0-9][0-9][0-9][0-9]\/[0-9][0-9][0-9]\/[0-9][0-9]/)
        match($0,/掲載日:.+/)
	str = substr($0,RSTART,RLENGTH)
	++works[str]
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
