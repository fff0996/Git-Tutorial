#!/usr/bin/perl

use warnings;
use strict;

my $r=$ARGV[0];
my $uni=$ARGV[1];
my $Homo=$ARGV[2];
my $not_homo=$ARGV[3];

#my @array;
my @search;
open(R,$r);
open(U,$uni);
open(H,">$Homo");
open(N,">$not_homo");

while(<U>){
  
     my $i=$_;
     chomp($i);
     push(@search,$i);
}
close U;
while(<R>){
     
    my $i=$_;
    chomp($i);
    
    #binary search############################## 
    my $first=0;					
    my $last=(scalar @search)-1;                
    my $index=-1;                              
    while( $first <= $last and $index == -1){  
          my $mid = int(($first+$last)/2);     
          if( $i eq $search[$mid]){             
               $index = $mid;                  
               print H $i,"\n";                
               last;                           
          }elsif($i lt $search[$mid]){           
    		$last= $mid-1;                  
          }else{                               
                $first= $mid+1;                 
           }                                    
     }                                         
     if($index == -1){                         
          print N $i,"\n";                     
     }                                         
    
}

close R;
close N;
close H;
     
