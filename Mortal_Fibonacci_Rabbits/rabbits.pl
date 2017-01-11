#! /usr/bin/env perl

use strict;
use warnings;

my $num_args=$#ARGV+1;
if($num_args!=2){
    print "\nUSAGE: mortal_rabbits.pl 6 3\n";
    print "\t arg1 = number of generations\n";
    print "\t arg2 = life span of a rabbit\n";
    exit;
}

my $gens = $ARGV[0]; 
my $life = $ARGV[1];

my @adults;
my @kids;

$adults[0]=0;
$kids[0]=1;

#print "i A C A\n";

for(my $i=1; $i<$gens; $i++){
    $adults[$i]=$kids[$i-1]+$adults[$i-1];
    $kids[$i]=$adults[$i-1];
#    print $i+1, " $adults[$i] $kids[$i] ";
    if($i>=$life){
	$adults[$i]-=$kids[$i-$life];
    }
#    print "$adults[$i]\n";
}

print $adults[$gens-1]+$kids[$gens-1],"\n";



