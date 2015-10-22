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
		my @splitline = split(/\s+/, $_);

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
		$aa_counters{$res}->{"res_count"}++;
		
#		my $acc_list = $aa_counters{$res}{'accessibilities'};
#		push @{$acc_list{'acc_all_atom_abs'}}, $acc_all_atom_abs;
#		push @{$acc_list{'acc_all_atom_rel'}}, $acc_all_atom_rel;
#		push @{$acc_list{'acc_side_abs'}}, $acc_side_abs;
#		push @{$acc_list{'acc_side_rel'}}, $acc_side_rel;
#		push @{$acc_list{'sec_structs'}}, $sec_struct_1;
#		if ($sec_struct_2 ne '-') {
#			push @{$acc_list{'sec_structs'}}, $sec_struct_2;
#		}

		push @{$aa_counters{$res}{'accessibilities'}{'acc_all_atom_abs'}}, $acc_all_atom_abs;
		push @{$aa_counters{$res}{'accessibilities'}{'acc_all_atom_rel'}}, $acc_all_atom_rel;
		push @{$aa_counters{$res}{'accessibilities'}{'acc_side_abs'}}, $acc_side_abs;
		push @{$aa_counters{$res}{'accessibilities'}{'acc_side_rel'}}, $acc_side_rel;
		push @{$aa_counters{$res}{'accessibilities'}{'sec_structs'}}, $sec_struct_1;
		if ($sec_struct_2 ne '-') {
			push @{$aa_counters{$res}{'accessibilities'}{'sec_structs'}}, $sec_struct_2;
		}
		
		print scalar($aa_counters{$res}{'accessibilities'}{'acc_side_rel'})." says hello?\n";
		
		# To reduce time spent calculating, only sum the values after reading all lines
	}
}

foreach my $res_key (sort keys %aa_counters) {
	# Retrieve alphabetised hash list of residues (names as keys, hash as value)
	# This hash's keys are: "res_count", a scalar; "accessibility", a hash [reference]
	
	print scalar($aa_counters{$res_key}{'accessibilities'})." says hi.\n";
	
	$res_length = scalar(@{$aa_counters{$res_key}{'accessibilities'}{'acc_all_atom_abs'}});
	print "Length for $res_key is $res_length!\n";
	
	my $count_str = "$res_key has $aa_counters{$res_key}{'res_count'} residues";
	print "$aa_counters{'res_key'}{'accessibilities'}{'acc_all_atom_abs'}[0]";
	print "$count_str.\n";
#	print "There are $aa_counters{$key}{$count} $key residues in $file.\n";
	exit;
}

close(IFILE) or die "Cannot close the file $file\n";

exit;
