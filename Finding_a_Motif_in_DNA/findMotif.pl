#! /usr/bin/env perl

use strict;
use warnings;

my $seq="";
my $motif="";

# There should be a more elegant way to do this.
# Fix later
while(<>){
    chomp;
    if(length($seq)==0){
	$seq=$_;
    }elsif(length($motif)==0){
	$motif=$_;
    }
}

print "seq: $seq\n";
print "motif: $motif\n";

my $temp="";
for(my $i=0; $i<=length($seq)-length($motif); $i++){
    $temp=substr($seq,$i,length($motif));
    if($temp eq $motif){
	print $i+1," ";
    }
#    print substr($seq,$i,length($motif)),"\n";
}
print "\n";

