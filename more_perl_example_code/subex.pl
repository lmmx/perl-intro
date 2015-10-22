#!/usr/bin/perl -w
#

sub mymax {
   my $max = shift(@_);
   foreach $var (@_) {
      $max = $var if $max < $var;
   }
   return $max;
}

my ($a, $b, $c, $d, $e ) = @ARGV;

$bigone = &mymax($a,$b,$c);
$bigtwo = &mymax($d,$e);

print "maxes are $bigone and $bigtwo \n";
