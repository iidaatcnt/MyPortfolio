open(IN, 'gb.tsv');
while(<IN>){
	chomp;
	my @d = split(/\t/, $_);
  #if(20 < $d[0]){
  #print $d[2], "\n";
  if('QB' eq $d[2]){
    print $_ , "\n";
  }
}
close(IN);
