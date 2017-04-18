#!/usr/bin/env perl

use strict;
use warnings;
use IO::Socket::SSL;
use WWW::Mechanize;

my $mech = WWW::Mechanize->new();

my $url = "https://www.google.co.jp";
$mech->get( $url );

$mech->follow_link( n => 3 );
#$mech->follow_link( text_regex => qr/download this/i );
#$mech->follow_link( url => 'http://host.com/index.html' );

&mstat;

sub mstat() {
	print "--------\n";
	print 'uri = '          , $mech->uri() ,"\n";
	print 'title = '        , $mech->title() , "\n";
	print 'status = '       , $mech->status() ,"\n";
	#print 'base = '         , $mech->base() ,"\n";
	print 'content_type = ' , $mech->content_type() ,"\n";
	#print 'current_form = ' , $mech->current_form() ."\n";
	#print 'forms = '        , $mech->forms() ."\n";
	#print 'is_html = '      , $mech->is_html() ,"\n";
	#print 'links = '        , $mech->links() ."\n";
	#print 'response = '     , $mech->response() / $mech->res() ,"\n";
	#print 'success = '      , $mech->success() , "\n";
	print "--------\n";
}
