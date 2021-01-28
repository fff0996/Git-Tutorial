#!/usr/bin/perl

use strict;
use warnings;

my $Uniprot_ENTREZ=$ARGV[0];
my $Drug_uniprot=$ARGV[1];
my $Drug_ENTREZ=$ARGV[2];

#my $ENSP_ENTREZ
#my $not_mapping=$ARGV[3];
#Uniprot to 9606.ENSP
my %hash; #key: uniport or ENSP
          #value :ENTREZ
open(U,$Uniprot_ENTREZ);
while(<U>){

    my $i=$_;
    chomp($i);
    $i =~ s/$//g;
    my ($Uniprot,$ENTREZ)=split(/\t/,$i);
    if(exists $hash{$Uniprot}){
	print $Uniprot,"\n";
        next;
     }else{
       $hash{$Uniprot}=$ENTREZ;
     }
}
close U;
# print mapping##################
#for my $i (sort keys(%hash)){  
#         print $i,"\t",$hash{$i},"\n"; 
#}                              

    
#Drug_target to ENSP
open(D,$Drug_uniprot);
open(E,">$Drug_ENTREZ");
#open(N,">$not_mapping");
while(<D>){
 
    my $i=$_;
    chomp($i);
    my @line=split(/\s+/,$i);
    
    print E $line[0],"\t";
    for(my $i=1; $i<=$#line;$i++){

    	if((exists $hash{$line[$i]}) and ($hash{$line[$i]} ne 'NA')){
       		print E $hash{$line[$i]},"\t";
    	}
      
    }
    print E "\n";	
}
close D;
close E;
#close N;
