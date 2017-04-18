#!/usr/bin/env perl

use strict;
use warnings;
use WWW::Mechanize;
use IO::Socket::SSL;
use utf8;
use Encode;
use Data::Dumper;


my $mech = WWW::Mechanize->new;
$mech->agent_alias( 'Windows Mozilla' );
my $url = 'http://www.google.co.jp';

$mech->get( $url );
$mech->success or die $mech->response->status_line;

$mech->submit_form(
    fields      => {
        q => 'ヤングジャンプ',
    }   
);

my @links = $mech->find_all_links(
    class => 'l' ,
);

my @texts = map { $_->text } @links;

foreach my $text ( @texts ){
    print "結果 -> ".$text."\n";
}
&mstat;

sub mstat() {
	print "--------\n";
	print 'uri = '          , $mech->uri() ,"\n";
	print 'title = '        , encode('utf-8',$mech->title()) , "\n";
	print 'status = '       , $mech->status() ,"\n";
	print 'base = '         , $mech->base() ,"\n";
	print 'content_type = ' , $mech->content_type() ,"\n";
	#print 'current_form = ' , Dumper $mech->current_form();
	#print 'forms = '        , Dumper $mech->forms();
	print 'is_html = '      , $mech->is_html() ,"\n";
	#print 'links = '        , Dumper $mech->links();
	print 'response = '     , $mech->response() / $mech->res() ,"\n";
	print 'success = '      , $mech->success() , "\n";
	print "--------\n";
}
