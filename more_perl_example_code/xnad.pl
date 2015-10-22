#!/usr/bin/perl -w
#

$pattern = '\W+NAD\W+COA';

print "Looking for $pattern \n";

while ( <> ) {
   print if /$pattern/; 
}

