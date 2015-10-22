#!/usr/bin/perl -w
#
# This script runs on the file "prion.data"
#
#print "Enter the name of the file to process: ";
#chomp($file = <STDIN> );

#print "Enter the name of the amino acid to count: ";
#chomp($amino = <STDIN> );

( @ARGV > 0 ) or die "no arguments supplied\n";
$file = shift;
open(FILE,$file) or die "unable to open file $file\n";

while ( <FILE> ) {

	next if /^\s*$/ ;  # skip blank lines
#	$lc++;
#	$rl++ if /^RES /;
#	$aa++ if /^RES $amino/;
	
	if ( /^RES/ ) {
		chomp;
		$total++;
		@a = split ( /\s+/, $_ );
		$res = $a[1];
		$acc = $a[3];
		$sec = $a[8];
#		print "$res $acc $sec \n";
		$res_counts{$res}++;
		$res_access{$res}+= $acc;
		$res_sstruc{$res}.= $sec; 
	}
}
close(FILE);

print "Total of $total residues \n";
foreach my $res ( sort keys %res_counts ) {
	print "RES> $res   counts $res_counts{$res} \t";
	$mean_access = $res_access{$res}/$res_counts{$res};
	print "mean_access ";
	printf "%6.2f \t", $mean_access;
	$h = $e = $c = 0;
	if ( defined $res_sstruc{$res} ) {
		$h = $res_sstruc{$res} =~ tr/H/H/;
		$e = $res_sstruc{$res} =~ tr/E/E/;
		$c = $res_sstruc{$res} =~ tr/[^EH]/C/;
	}
	print "H $h   E $e   C $c\n";
}

#print "Stats in $file:\n#lines\t\t$lc\n#residues\t$rl\n$amino\'s\t\t$aa\n";

