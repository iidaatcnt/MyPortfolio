#!/usr/bin/env perl

use strict;
use warnings;

my $sendmail = '/usr/sbin/sendmail'; # sendmailコマンドパス
my $from = 'iida.m@cntsv.jp'; # 送信元メールアドレス
my $to = 'iida.masa@cntsv.jp'; # あて先メールアドレス
my $cc = 'iida.m@cntsv.jp'; # Ccのあて先メールアドレス
my $subject = 'test'; # メールの件名
my $msg = <<"_TEXT_"; # メールの本文(ヒアドキュメントで変数に代入)
message line 1
message line 2
_TEXT_

print "from = $from\n";
print "to = $to\n";
print "cc = $cc\n";
print "subject = $subject\n";
print "msg = $msg\n";

# sendmail コマンド起動
open(SDML,"| $sendmail -t -i") || die 'sendmail error';
# メールヘッダ出力
print SDML "From: $from\n";
print SDML "To: $to\n";
print SDML "Cc: $cc\n";
print SDML "Subject: $subject\n";
print SDML "Content-Transfer-Encoding: 7bit\n";
print SDML "Content-Type: text/plain;\n\n";
# メール本文出力
print SDML "$msg";
# sendmail コマンド閉じる
close(SDML);
