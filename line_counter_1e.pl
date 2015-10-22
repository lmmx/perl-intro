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
		
#		my %accessibilities = (
#			'acc_all_atom_abs' => $acc_all_atom_abs,
#			'acc_all_atom_rel' => $acc_all_atom_rel,
#			'acc_side_abs' => $acc_side_abs,
#			'acc_side_rel' => $acc_side_rel,
#			'sec_struct_1' => $sec_struct_1,
#			'sec_struct_2' => $sec_struct_2,
#		)
		
		# The thin arrow operator "->" dereferences this hash
		# allowing it to be auto-incremented (with "++").
		$aa_counters{$res}->{"count"}++;
#		$aa_counters{$res}->{"accessibilities"} = \%accessibilities;
	}
}

foreach my $key (sort keys %aa_counters) {
	# Print counts for alphabetised list of residue names
	foreach $hashkey (keys $aa_counters{$key}) {
		my ($count_str. $access_str);
		if ($hashkey eq "count") {
			$count_str = "$key has $aa_counters{$key}{$hashkey} residues.";
		} elsif ($hashkey eq "accessibilities") {
			# dereference the hash-within-a-hash...
			# $access_str = "$aa_counters{key}{hashkey}";
		}
		print "$countstr, with total accessibility: $access_str.\n";
	};
#	print "There are $aa_counters{$key}{$count} $key residues in $file.\n";
}

close(IFILE) or die "Cannot close the file $file\n";

exit;
