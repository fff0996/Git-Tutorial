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



   







