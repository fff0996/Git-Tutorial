#!/usr/bin/perl

use warnings;
use strict;

my $file=$ARGV[0];
my %hash;

open(I,$file);

my $i=<I>;
chomp($i);

while(<I>){
   
   $i=$_;
   chomp($i);
   my ($Drug,$Target)= split(/\t/,$i);
   if(exists $hash{$Drug}){
       push(@{$hash{$Drug}},$Target);   
   }else{
     @{$hash{$Drug}}=();
     push(@{$hash{$Drug}},$Target);
    }      
}
close I;

for my $i (keys %hash){
        print $i," ";
         for my $j (@{$hash{$i}}){
             print $j," ";
         }
        print "\n";
}


