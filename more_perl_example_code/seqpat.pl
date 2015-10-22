#!/usr/bin/perl -w
#

while ( <> ) {
   chomp;
   if ( /^>/ ) { $prot = $_;}
   if ( /(HE.{2}H)(.+)A/ ) {
       printf("PRO> %s %s %s %s\n",$prot,$_,$1,$2);
   }

}
