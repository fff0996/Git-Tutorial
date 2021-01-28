#!/usr/bin/perl
use strict;
use warnings;

my $ENSP_ENTREZ=$ARGV[0];
my $net=$ARGV[1];
my $output=$ARGV[2];

my %hash;
open(E,$ENSP_ENTREZ);
#make mapping table
#use hash
while(<E>){

    my $i=$_;
    chomp($i);
    #ctrl+ v+ m
    $i =~ s/^M//g;
    my ($ENSP,$ENTREZ)=split(/\t/,$i);
    if(exists $hash{$ENSP}){
	print $i,"\n";
        next;
     }else{
       $hash{$ENSP}=$ENTREZ;
     }
}
close E;
#mapping
open(N,$net);
open(O,">$output");
while(<N>){

    my $i=$_;
    chomp($i);
    my @line=split(/\s+/,$i);

    #print E $line[0],"\t";
    if(exists $hash{$line[0]} and exists $hash{$line[1]}){print O $hash{$line[0]}," ",$hash{$line[1]}," ",$line[2],"\n";}
    else{next;}
    

}
close N;
close O;
