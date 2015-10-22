#!/usr/bin/perl

use warnings;
use bignum;
#use strict;

my $file;
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

my @accessibilities;

foreach (@lines) {
	if ($_ =~ /^RES/) {
		my @splitline = split(/\s/, $_);

		my $res = $splitline[1];
		my $acc_all_atom_abs = $splitline[3];
		my $acc_all_atom_rel = $splitline[4];
		my $acc_side_abs = $splitline[5];
		my $acc_side_rel = $splitline[6];
		my $sec_struct_1 = $splitline[7];
		my $sec_struct_2 = $splitline[8];

		# The residue name is now used to make a hash reference

		# The thin arrow operator "->" dereferences this hash
		# allowing it to be auto-incremented (with "++").
		$aa_counters{$res}->{"count"}++;
		# Look up scoping
		$aa_counters{$res}->{"accessibilities"} = \%accessibilities;
	}
}

foreach my $key (sort keys %aa_counters) {
	# Print counts for alphabetised list of residue names
	foreach $hashkey (keys $aa_counters{$key}) {
		if ($hashkey == "") {
			print "$key has $aa_counters{$key}{$hashkey} residues.\n";
		} elsif ($hashkey == "") {
			print "$key";
		}
	};
#	print "There are $aa_counters{$key}{$count} $key residues in $file.\n";
}

close(IFILE) or die "Cannot close the file $file\n";

exit;
