#!/usr/bin/perl -w
#
#

( @ARGV >= 2 ) or die "not enough arguments \n";

open (FILE,$ARGV[0]) or die "no such file as $ARGV[0] !\n";
open (COPY,">$ARGV[1]");

#while ( $line = <FILE> ) { print COPY $line };
#print "copied $ARGV[0] to $ARGV[1]\n";

print COPY while <FILE> ;
print "copied $ARGV[0] to $ARGV[1]\n";

