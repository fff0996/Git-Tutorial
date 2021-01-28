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
	my @line= split(/\s+/,$i);
	if(scalar @line ==1){
		next;
	}else{
		for my $value (@line){
			print O $value,"\t";
		}
		print O "\n";
	}
}
close I;
close O;	
