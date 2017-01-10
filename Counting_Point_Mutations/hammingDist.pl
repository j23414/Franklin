#! /usr/bin/env perl

use strict;
use warnings;

my $seq1="";
my $seq2="";

# There should be a more elegant way to do this.
# Fix later
while(<>){
    chomp;
    if(length($seq1)==0){
	$seq1=$_;
    }elsif(length($seq2)==0){
	$seq2=$_;
    }
}
# print "s1: $seq1\ns2: $seq2\n";

if(length($seq1)!=length($seq2)){
    print "both sequences must be same length!\n";
    exit;
}
my @arr1=split //,$seq1;
my @arr2=split //,$seq2;

my $dif=0;
for(my $i=0; $i<length($seq1); $i++){
    if($arr1[$i] ne $arr2[$i]){
	$dif++;
    }
}
print "$dif\n";

