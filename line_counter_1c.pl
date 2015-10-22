#!/usr/bin/perl

use warnings;
#use strict;

my $residue;
my $file;
my $filearg;

if (scalar(@ARGV) == 0) {
	print "Enter file to read: ";
	$file = <>;
	chomp($file);
} else {
	# at least 1 argument, the first of which should be a filename
	print "Using $ARGV[0] as the filename to read.\n";
	$file = $ARGV[0];
}

print "Enter residue: ";
$residue = <STDIN>;
chomp($residue);
print "Residue is $residue.\n";

open(IFILE, $file) or die "Cannot open the file $file\n";

@lines = <IFILE>;

#while (length($residue) != 3) {
#  warn("Please provide a 3 character residue code, e.g. ALA (Alanine).");
#  chomp($residue = <>);
#}

$linecount = 0;

foreach (@lines) {
  if ($_ =~ /^RES/ && $_ =~ uc($residue) ) {
    $linecount++;
  }
}

print "Read $linecount lines from the file $file\n";

close(IFILE) or die "Cannot close the file $file\n";

exit;
