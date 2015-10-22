#!/usr/bin/perl -w
#
# Read in a fasta format sequence
#

open (IFILE, $ARGV[0]) or die "no such file as $ARGV[0]\n";
#
# Read one line at a time into $line. 
# If it begins with a > ignore it.
# Remove the new line from the end of each line
#
while ( $line = <IFILE> ) {
   if( $line !~ /^>/ ) {
     chomp($line);	
     $sline .= $line; 
   }
}   
close(IFILE);
#
# Split the $sline string into characters and report number
#
@seq = split //, $sline;
$seqlen = @seq;
print ">Newseq: Read $seqlen amino acids in $ARGV[0]\n";
#
# print them out, $linelength to a line
#
$i=0;
$linelength = 80;
foreach $amino (@seq) {
   $i++;
   print $amino;
   if ( $i >= $linelength ) {
      print "\n";
      $i=0;
   }
}
#
# Print one more newline to tidy up
#
print "*\n";
