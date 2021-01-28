#!/usr/bin/perl


use strict;
use warnings;

my $result=$ARGV[0];
my $not_9606=$ARGV[1];
my $output=$ARGV[2];
my $not_mapping=$ARGV[3];

my %hash;
open(N,$not_9606);
while(<N>){
    my $i=$_;
    chomp($i);
    $hash{$i}=1;
}
close N;

open(R,$result);
open(O,">$output");
open(G,">$not_mapping");
while(<R>){
    my $i=$_;
    chomp($i);
    my @line=split(/\t/,$i);
    for my $value (@line){
	if($value =~ /DB.*/ or $value =~ /9606.ENSP.*/){
		print O $value,"\t";
        }             
        else{
		if(!exists $hash{$value}){
	                print O $value,"\t";
                        print G $value,"\n";
                }
        }
     }
    print O "\n";
}
close R;
close O;
close G;

    

