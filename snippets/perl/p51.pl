while (defined($line = <STDIN>)) {
  $res = `ls -l $line`;
  #print "I saw $line";
  print "I saw $res";
}
