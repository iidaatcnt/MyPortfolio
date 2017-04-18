use strict;
use warnings;
use Data::Dumper;

my @array = (1, 2, 3, 4, 5);
my $array_ref = [@array];

my %hash = (
								name => "tarou",
								age => 20,
					 );
my $hash_ref = {%hash};

print Dumper @array;
print Dumper %hash;

print Dumper $array_ref;
print Dumper $hash_ref;

1;
