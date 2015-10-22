#!/usr/bin/perl -w
#

while ( <STDIN> ) {

   @words = split " ", $_;
   print "$words[4]";

}

print "\n";