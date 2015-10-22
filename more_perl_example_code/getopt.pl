#!/usr/bin/perl -w
#
#
# How to use the Getopt module
#

use strict;  

use vars qw($opt_a $opt_b $opt_s $opt_t $opt_c);   # do this if using strict

use Getopt::Std;    # you need this in order to use the module !

#
# options variables. Declare all the variables you want to use here.
# If you want to pass a parameter to the program, put a colon after
# the variable (single letter)
#
getopts('abct:s:');

my $scale  = ( defined $opt_s ) ? $opt_s : 1;
my $threshold = (defined $opt_t ) ? $opt_t : 0.0;

print "scale = $scale \n";
print "threshold = $threshold\n";


