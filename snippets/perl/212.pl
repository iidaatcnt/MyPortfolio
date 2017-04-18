#!/usr/bin/env perl

##my $r = 12.5;
#my $pai = 3.141592654;
#
#print "Please input r=";
#chomp($r = <STDIN>);
#if ( 0 > $r ) {
#  $r = 0;
#}
#print $r * 2 * $pai;
#print "\n";

#my $x;
#my $y;
##print "Please input x=";
#chomp($x = <STDIN>);
##print "Please input y=";
#chomp($y = <STDIN>);
#print $x * $y;

#my $str;
#my $n;
#my $cnt;
#print "Please input str=";
#$str = <STDIN>;
#print "Please input n=";
#chomp($n = <STDIN>);
#$cnt = 0;
#while ($cnt < $n) {
#  print $str;
#  $cnt += 1;
#}

# これはどっちもdedinedになる
#$madonna = <STDIN>;
$madonna = undef;
if ( defined($madonna) ) {
    print "The input was $madonna"; 
} else {
    print "No input available!\n"; 
}
