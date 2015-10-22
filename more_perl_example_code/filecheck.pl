#!/usr/bin/perl -w
#
#

foreach $FILE ( @ARGV ) {

   if ( -e $FILE ) {
      print "file $FILE exists ";
   }
   if ( -x $FILE ) { print "and is a program "; }
  	print "\n";

}
