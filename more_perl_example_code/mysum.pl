#!/usr/bin/perl -w
#

use strict;
use CGI;

print "total = ", mysum(@ARGV), "\n";

sub mysum {
  my @params = @_;
  my $total = 0.0;
  foreach my $par (@params) {
     $total += $par;
  }
  return $total;
}
