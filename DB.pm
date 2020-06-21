package DB;

use DBI;
use strict;

sub new {
   my $class = shift;
   my $self = {};

   # my $hostname = "connectionString";
   # my $port = "3306";
   # my $userid = "USER";
   # my $password = "PWD";
   # my $database = "DB";
   # my $dsn = "DBI:mysql:database=$database;host=$hostname;port=$port";

   # my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;

   # $self->{"db"} = $dbh;
   bless $self, $class;
   return $self;
} 

sub sendToDB {
   my $self = shift;
   my $currencies = shift;
   my $time = shift;

   my $dbh = $self->{"db"};

   foreach my $currency (keys %$currencies) {
      print "INSERT IGNORE INTO currencies-perl SET date=$time, currency=$currency, rate=$currencies->{$currency}\n";
      # $dbh->do("INSERT IGNORE INTO currencies-perl SET date=$time, currency=$currency, rate=rate");
   }

}

1;