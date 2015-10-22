#!/usr/bin/perl -w
#

use warnings;
#use strict;

$file = "$ARGV[0]";

open(IFILE, $file) or die "Cannot open the file $file\n";

@lines = <IFILE>;

$linecount = @lines;

print "Read $linecount lines from the file $file\n";

close(IFILE) or die "Cannot close the file $file\n";

exit;
