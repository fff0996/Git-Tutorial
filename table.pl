#!/usr/bin/perl

use strict;
use warnings;

my $Uniprot_sum=$ARGV[0];
my $table=$ARGV[1];

open(U,$Uniprot_sum);

open(T,">$table");
my %hash;
my $value=0;
while(<U>){

     my $i=$_;
     chomp($i);
     if(exists $hash{$i}){
         next;
     }else{
         $value=$value+1;
         $hash{$i}=$value;
         print T $i,"\t",$hash{$i},"\n";
     }
}
close U;
