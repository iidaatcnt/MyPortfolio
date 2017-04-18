#!/usr/bin/perl -w

use WWW::Mechanize;
use strict;
use Storable;

$SIG{__WARN__} = sub {} ;  # ssssssh

my $Cities = retrieve("cities.dat");

my $m = WWW::Mechanize->new();
$m->get("http://local.yahoo.com/");

my @cities = sort { $Cities->{$a}{RANK} <=> $Cities->{$b}{RANK} } keys %$Cities;
foreach my $c ( @cities ) {
	my $fields = {
		'stx' => "starbucks",
		'csz' => $c,
	};

	my $r = $m->submit_form(form_number => 2,
			fields => $fields);
	die "Couldn't submit form" unless $r->is_success;

	my $hits = number_of_hits($r);
#  my $ppl  = sprintf("%d", 1000 * $Cities->{$c}{POP} / $hits);
#  print "$c has $hits Starbucks.  That's one for every $ppl people.\n";
	my $density = sprintf("%.1f", $Cities->{$c}{AREA} / $hits);
	print "$c : $density\n";
}

sub number_of_hits {
	my $r = shift;
	my $c = $r->content;
	if ($c =~ m{\d+ out of <b>(\d+)</b> total results for}) {
		return $1;
	}
	if ($c =~ m{Sorry, no .*? found in or near}) {
		return 0;
	}
	if ($c =~ m{Your search matched multiple cities}) {
		warn "Your search matched multiple cities\n";
		return 0;
	}
	if ($c =~ m{Sorry we couldn.t find that location}) {
		warn "No cities\n";
		return 0;
	}
	if ($c =~ m{Could not find.*?, showing results for}) {
		warn "No matches\n";
		return 0;
	}
	die "Unknown response\n$c\n";
}

