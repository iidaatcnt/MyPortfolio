#!/usr/bin/env perl

use strict;
use warnings;
use IO::Socket::SSL;
use utf8;
use Encode;
use Data::Dumper;

use WWW::Mechanize;
my $mech = WWW::Mechanize->new();

$mech->get( 'https://www.google.co.jp/' );

#$mech->follow_link( n => 3 );
#$mech->follow_link( text_regex => qr/download this/i );
#$mech->follow_link( url => 'http://host.com/index.html' );

#$mech->submit_form(
#    form_number => 3,
#    fields      => {
#        username    => 'mungo',
#        password    => 'lost-and-alone',
#    }
#);

$mech->submit_form(
    form_name => 'q',
    fields    => { query  => 'perl', },
#    button    => 'Search Now'
);
