#! /usr/bin/env perl

use strict;
use warnings;

my $rna;
while(<>){
    chomp;
    $rna=$rna.$_;
}

my %AACode=();
open(my $fh, '<:encoding(UTF-8)',"codon.txt") or die "Could not open file 'codon.txt' $!";

while (<$fh>) {
    chomp;
    if(/(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)\s+(\S+)/){
	$AACode{$1}=$2;
	$AACode{$3}=$4;
	$AACode{$5}=$6;
	$AACode{$7}=$8;
    }
}

my $temp="";
for(my $i=0; $i<=(length($rna)-3); $i=$i+3){
    $temp=$AACode{substr($rna,$i,3)};
    if($temp ne "Stop"){
	print $temp;
    }
}
print "\n";
