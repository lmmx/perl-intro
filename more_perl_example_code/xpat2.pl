#!/usr/bin/perl -w
#

$pat1 = 'DTG';
$pat2 = '[^P]N[^P][ST]';

print "Looking for $pat1 then $pat2 \n";

while ( <> ) {
   if ( /($pat1)(.+?)($pat2)/ ) {
     
	printf "Match %s %s %s \n", $1,$2,$3 ;   

   }
}

