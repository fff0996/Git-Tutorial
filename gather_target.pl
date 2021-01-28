#!/usr/bin/perl

use warnings;
use strict;

my $db=$ARGV[0];

my %hash;

open(D,$db);
while(<D>){
	my $i=$_;
	chomp($i);
	my @line=split(/\s+/,$i);
	for(my $index=1; $index<=scalar @line -1; $index++){
		if(exists $hash{$line[$index]}){
			next;
                }else{
			$hash{$line[$index]}=1;
                        print $line[$index],"\n";
 		}
	}
}
close D;
