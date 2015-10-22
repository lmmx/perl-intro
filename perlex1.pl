#!/usr/bin/perl
#
#
# This script will run on the file "1abc.sec"
#
# using strictures is good practice
# 
use strict;

my %sstruc;   # declare the hash to store secondary structure info

#
# use the open statement to open up a file handle SSTRUC to the
# first argument type on the command line of your script
#

open(SSTRUC,$ARGV[0]) or die "Can't open sstruc file: $ARGV[0] \n";

while (my $line = <SSTRUC> ) {     # read one line at a time
        chomp($line);	           # clip off the newline 		
	my @LINE = split(/\s+/,$line);   # split it into words
	my $amino = $LINE[4];	         # and cut out the amino acid name
	my $sec = $LINE[6];              # and the secondary structure state  
	
#	print " LINE '$LINE[0]' $LINE[1] $LINE[2] $LINE[3] $LINE[4] $LINE[5] $LINE[6] \n";
	 
	$sstruc{$amino} .= $sec . " ";   # then store this in a hash
#
# note: this uses a hash %sstruc to store data which is keyed on amino
# acid type $amino. It uses the .= operator which will append to the growing
# line. Hence, we get a string with all the secondary structure one-letter
# codes all listed separated by white space
#
}

my $total = 0;   # reset some counter variables
my $nlines = 0;

#
# loop through the hash, one amino acid at a time, 
# using the keys function and also sort them !

foreach my $amino (sort keys %sstruc) {
   $total++;   # total is already declared outside the loop
   my $number = 0;
   my $helix = 0;    # set a few more counters to zero
   my $strand = 0;
   my $coil = 0;
   
# split the 2ndary structure string

   my @sectypes = split(" ", $sstruc{$amino});  

#
# loop through these one by one with another foreach loop 
#
   foreach my $sectype (@sectypes) {
      $number++;
      if ( $sectype eq "H" ) {
         $helix++;
      } elsif ( $sectype eq "E" ) {
	 $strand++;
      } else {
	 $coil++;
      }
   }
   printf("AminoAcid %3s Total %3d Helix %3d Strand %3d Coil %3d \n",$amino,$number,$helix,$strand,$coil);
   $nlines += $number;
}

printf("Total of %d aminoacids (%d different types) \n",$nlines,$total);
