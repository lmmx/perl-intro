#!/usr/bin/perl -w
#

if ( $#ARGV < 0 ) {
  die "no arguments supplied - quitting ";
}

while ( <> ) {
   print "$ARGV $_";
}
