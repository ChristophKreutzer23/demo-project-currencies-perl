use strict;

use LWP::Simple;
use Xml;
use DB;

my $content = get('https://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml');

my $xml = new Xml($content);
my $db = new DB();

$xml->parse();

my $time = $xml->getTime();
my $currencies = $xml->getCurrencies();

$db->sendToDB($currencies, $time);