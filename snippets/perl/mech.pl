use WWW::Mechanize;
my $mech = new WWW::Mechanize( autocheck => 1 );

#$mech->get("http://www.google.co.jp/");
#$mech->submit_form(...
#$mech->get(...

$mech->get('http://www.google.co.jp/blogsearch?hl=ja&amp;q=link:e8y.net&amp;scoring=d');

$mech->follow_link(text => "もっと読む");

