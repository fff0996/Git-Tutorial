#!/usr/bin/perl
use strict;
use warnings;

my $ENSP_ENTREZ=$ARGV[0];
my $net=$ARGV[1];
my $output=$ARGV[2];

my %hash;
open(E,$ENSP_ENTREZ);
while(<E>){

    my $i=$_;
    chomp($i);
    $i =~ s///g;
    my ($ENSP,$ENTREZ)=split(/\t/,$i);
    if(exists $hash{$ENSP}){
	print $i,"\n";
        next;
     }else{
       $hash{$ENSP}=$ENTREZ;
     }
}
close E;
open(N,$net);
open(O,">$output");
while(<N>){

    my $i=$_;
    chomp($i);
    my @line=split(/\s+/,$i);

    #print E $line[0],"\t";
    for(my $index=0; $index<=1;$index++){

        if((exists $hash{$line[$index]}) and ($hash{$line[$index]} ne 'NA')){
                                                                             
                print O $hash{$line[$index]}," ";
        }
	else{
		print O $line[$index]," ";
	} 

    }
    print O  $line[2],"\n";

}
close N;
close O;
