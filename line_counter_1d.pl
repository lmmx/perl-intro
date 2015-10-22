#!/usr/bin/perl

use warnings;
#use strict;

my $residue;
my $file;
my $filearg;
my %aa_counters;

if (scalar(@ARGV) == 0) {
	print "Enter file to read: ";
	$file = <>;
	chomp($file);
} else {
	# at least 1 argument, the first of which should be a filename
	print "Using $ARGV[0] as the filename to read.\n";
	$file = $ARGV[0];
}

open(IFILE, $file) or die "Cannot open the file $file\n";

@lines = <IFILE>;

foreach (@lines) {
	if ($_ =~ /^RES/) {
		my @splitline = split(/\s/, $_);
		my $res = $splitline[1];
		$aa_counters{$res}++;
	}
}

foreach my $key (sort keys %aa_counters) {
	# Print counts for alphabetised list of residue names
	print "There are $aa_counters{$key} $key residues in $file.\n";
}

#print "Read $linecount lines from the file $file\n";

close(IFILE) or die "Cannot close the file $file\n";

exit;
