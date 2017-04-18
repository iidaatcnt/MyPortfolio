use strict;
use HTTP::Proxy;
use HTTP::Recorder;

my $proxy = new HTTP::Proxy(host => '127.0.0.1', port => 5656);
my $agent = new HTTP::Recorder(showwindow => 0, file => 'proxy.log');

$proxy->agent($agent);
$proxy->start();

