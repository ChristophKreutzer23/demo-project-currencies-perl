package Xml;

use XML::Parser::Lite;
use strict;

sub new {
   my $class = shift;
   my $self = {
      _document => shift,
      currencies => ()
   };
   bless $self, $class;
   return $self;
} 

sub getTime {
   my ($self) = @_;
   return $self->{"time"};
}

sub getCurrencies {
   my ($self) = @_;
   return $self->{currencies};
}

sub parse {
   my ( $self ) = @_;
   my $p1 = new XML::Parser::Lite();
   $p1->setHandlers(
      Start => sub {
         if ($_[2] eq "time"){
            $self->{"time"} = $_[3];
         }
         if ($_[2] eq "currency"){
            my $currency = $_[3];
            my $rate = $_[5]; 
            $self->{currencies}->{$currency} = $rate;
         }
      },
      Char => sub { shift; },
      End => sub { shift; },
   );
   $p1->parse($self->{_document});
}

1;