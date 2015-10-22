#!/usr/bin/perl -w
#

if ( $#ARGV < 0 ) {
  die "no arguments supplied - quitting ";
}

open (IFILE, $ARGV[0] ) or die "unable to open file $ARGV[0]";

while ( <IFILE> ) {
   print;
}
