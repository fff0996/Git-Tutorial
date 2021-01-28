#!/usr/bin/perl

use strict;
use warnings;

my $input=$ARGV[0];

open(I,$input);

while(<I>){

   my $i=$_;
   chomp($i);
   my @line = split(/\s+/,$i);
   for my $l (@line){
      if($l =~ /^[A-Z]/ ){
        if(!($l =~ /^DB/)){
           print $l,"\n";
        } 
       }
    }
}
close I;

