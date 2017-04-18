#!/usr/bin/env perl

use strict ;
use warnings;

my $mailto = 'vagrant@localhost';
my $limit  = 180;
my $sendmail_path = "/usr/sbin/sendmail ";

{
	my $res_df = `df -Pk /`;
print "$res_df\n";
print "----\n";
	my $free = "";
	{
		my @tmp = split(/\n/,$res_df);
print "@tmp\n";
print "----\n";
		my $tmp2 = $tmp[1];
print "$tmp2\n";
print "----\n";
		@tmp = split(/\s+/,$tmp2);
print "@tmp\n";
print "----\n";
		$free = $tmp[3];
print "$free\n";
print "----\n";
	}
	if($limit * 1024 > $free)
	{
		my $mail = "";
		$mail .= "From: root\n";
		$mail .= "To: " . $mailto . "\n";
		$mail .= "Subject: Warning for disk capacity\n";
		$mail .= "\n";
		$mail .= `df -h`;
		$mail .= "\n";
		
		open (MAIL, "|$sendmail_path $mailto");
		print MAIL $mail;
		close(MAIL);
	}
}

