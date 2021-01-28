#!/usr/bin/perl

use strict;
use warnings;

my $input=$ARGV[0];
my $db=$ARGV[1];
my $net=$ARGV[2];

my $db_output=$ARGV[3];
my $net_output=$ARGV[4];

open(DO,">$db_output");
open(NO,">$net_output");

open(D,$db);
open(N,$net);

open(I,$input);

#save table
my %hash;
#my $value=0;
while(<I>){

    my $i=$_;
    chomp($i);
    #$value= $value+1;
    my($uniprot,$integar)=split(/\t/,$i);
    $hash{$uniprot}=$integar;
    #if(exists $hash{$i}){
    #	next;
    #}else{
    #     $hash{$i}=$value;
	
    #}
}
close I;
print keys%hash;

while(<D>){

    my $i=$_;
    chomp($i);
    my @line= split(/\s+/,$i);
    for my $value (@line){
        if(exists $hash{$value}){
           print DO $hash{$value}," ";
        }else{
           print DO $value," ";
        }
    }
    print DO "\n";
}
close D;
close DO;

while(<N>){

     my $i=$_;
     chomp($i);
     my @line= split(/\t/,$i);
     for my $value (@line){
        if(exists $hash{$value}){
          print NO $hash{$value},"\t";
        }else{
          print NO $value,"\t";
        }
     }
     print NO "\n";
}
close NO;
close N;

     
     

     
    

