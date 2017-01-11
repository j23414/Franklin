#! /usr/bin/env perl

use strict;
use warnings;

my $sum=0;
while(<>){
    $sum=0;
    if(/(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)/){
	$sum+=$1*2;      # AA-AA
	$sum+=$2*2;      # AA-Aa
	$sum+=$3*2;      # AA-aa
	$sum+=$4*2*0.75; # Aa-Aa
	$sum+=$5*2*0.5;  # Aa-aa
#	$sum+=$6*2*0;      # aa-aa
	print $sum,"\n";
    }
}
