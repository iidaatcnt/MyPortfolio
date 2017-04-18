#!/usr/bin/env perl

use strict;
use warnings;
use IO::Socket::SSL;
use WWW::Mechanize;
use Data::Dumper;

my $mech = WWW::Mechanize->new();

my $url = "https://www.yahoo.co.jp/";

$mech->get( $url );
&mstat;

#print $mech->content() , "\n";

#$mech->form_name( "f" );


#print $mech->content();

$mech->submit_form(
	form_name => 'sf1',
	fields    => { query  => 'pot of gold', },
	button    => '検索'
);

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
