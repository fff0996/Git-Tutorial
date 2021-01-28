#!/usr/bin/perl

use strict;
use warnings;

my $input=$ARGV[0];
my $output=$ARGV[1];

open(I,$input);
open(O,">$output");

while(<I>){

    my $i=$_;
    chomp($i);
    my @array = split(/\s+/,$i);
    print O $array[0],"\t";
    for (my $j=1; $j <= $#array; $j++){
       print O int($array[$j]),"\t";
    }
    print O "\n";
}
close I;
close O;


