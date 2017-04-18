#!/usr/bin/env perl

#use lib "/home/ymko/perl5/lib/perl5"; # cronの環境変数対策
use strict;
use warnings;
use Time::Local;
use Email::Simple;
use Email::Sender::Simple qw/sendmail/;
use Email::Sender::Transport::SMTP::TLS;
use Encode;

my $username = 'miidacnt@gmail.com';
my $password = 'iceman16elt';
my $mailto   = 'iida.m@cntsv.jp';

main();
exit 0;

sub main {
	my ( $mday, $mon, $year ) = ( GetToday() )[ 3 .. 5 ];
	my $mon_end_day = GetEndDay( $year, $mon );
	my $target_day = $mon_end_day - 3;

	if ( $mday == $target_day ) {
		SendNotifyMail( "家賃振込み日通知",
				"大家に怒られるで？" );
	}
}

sub SendNotifyMail {
	my ( $title, $body ) = @_;

	my $sender = Email::Sender::Transport::SMTP::TLS->new(
			host     => 'smtp.gmail.com',
			port     => 587,
			username => $username,
			password => $password,
			);

	my $email = Email::Simple->create(
			header => [
			From    => '"メールサービス" ' . "<$username>",
			To      => $mailto,
			Subject => encode( 'MIME-Header-ISO_2022_JP', $title ),
			],
			attributes => {
			content_type => 'text/plain',
			charset      => 'ISO-2022-JP',
			encoding     => '7bit',
			},
			body => $body,    # メール本文
			);

	sendmail( $email, { transport => $sender } );
	return 1;
}

sub GetToday {
	my ( $sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst )
		= localtime( time() );
	$year += 1900;
	$mon  += 1;
	return ( $sec, $min, $hour, $mday, $mon, $year, $wday, $yday, $isdst );
}

sub GetEndDay {
	my ( $year, $mon ) = @_;
	if ( !$year       || !$mon )        { return; }
	if ( $year < 1900 || $year > 2023 ) { return; }
	if ( $mon < 1     || $mon > 12 )    { return; }
	if ( $mon == 12 ) { $mon = 0; }
	my $time = timelocal( 0, 0, 0, 1, $mon, $year - 1900 );
	$time -= 60 * 60 * 24;
	my @date = localtime($time);
	return $date[3];
}



