#!/usr/bin/perl

use warnings;
use strict;

my $input=$ARGV[0];
my $output=$ARGV[1];

open(I,$input);
open(O,">$output");
while(<I>){
   my $i=$_;
   chomp($i);
   my($protein1,$protein2,$score)=split(/\s+/,$i);
   print O int($protein1),"\t",int($protein2),"\t",int($score),"\n";
}
close I;
close O;

   
