@fred = 6..10;
print "@fred\n";
#@barney = reverse(@fred);
#print @barney;
#@wilma = reverse 6..10;
#print @wilma;
@fred = reverse @fred;
print "@fred\n";

