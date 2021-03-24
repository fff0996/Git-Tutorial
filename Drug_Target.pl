#making hash table 
# \hash table, Drug, target
sub Drug_Target{
   my($hash,$Drug,$Target)=@_;
   if(exists %$hash{$Drug}{
      push(@{%$hash{$Drug}},$Target);
   }else{
      @{%$hash{$Drug}}=();
      push(@{%$hash{$Drug}},$Target);
   }
}

#filter ; only we leave elements that we want
#\hash table, qeury
sub filter{
   my($hash,$quer)=@_;
   if(exists %$hash{$query}){ return 1;}
   else{ return 0;}
}



   







