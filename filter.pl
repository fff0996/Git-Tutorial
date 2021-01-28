#!/usr/bin/perl

use strict;
use warnings;

my $drug_list=$ARGV[0];
my $drug_target=$ARGV[1];
my $output=$ARGV[2];
open(D,$drug_list);
open(T,$drug_target);
open(O,">$output");
my @Drug;
while(<D>){
    my $i=$_;
    chomp($i);
    push(@Drug,$i);
}
close D;
while(<T>){
     my $i=$_;
     chomp($i);
     my @line =split (/\s+/,$i);
     my $first=0;
     my $last=(scalar @Drug) -1;
     my $index=-1;
     while($first <= $last and $index ==-1){
          my $mid = int(($first+$last)/2);
          if($line[0] eq $Drug[$mid]){
               print O $i,"\n";
               $index= $mid;
               last;
          }elsif($line[0] lt $Drug[$mid]){
               $last=$mid-1;
          }else{
               $first=$mid+1;
          }
       }
}
 
close T;
close O;
