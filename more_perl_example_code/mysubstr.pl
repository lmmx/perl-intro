#!/usr/bin/perl -w
#

while ( <> ) {
   unless ( /^\s*$/ ) {
     chomp;
     $amino = substr($_,15,3);
     $sec = substr($_,21,1);
     print "AMINO= $amino SEC = $sec \n";
   }
}