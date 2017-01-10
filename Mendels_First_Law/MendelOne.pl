#! /usr/bin/env perl

use strict;
use warnings;

my $num_args=$#ARGV+1;
if($num_args!=3){
    print "\nUSAGE: ./MendelOne.pl 2 2 2\n";
    print "\t arg1 = number of DD homozygous dominant \n";
    print "\t arg2 = number of Dd heterozygous\n";
    print "\t arg3 = number of dd homozygous recessive\n";
    exit;
}

my $k=$ARGV[0];
my $m=$ARGV[1];
my $n=$ARGV[2];
my $sum=$k+$m+$n;

my $containsDom = ($k/$sum);                      # DD x __
$containsDom += ($m/$sum)*($k/($sum-1));          # Dd x DD
$containsDom += ($n/$sum)*($k/($sum-1));          # dd x DD
$containsDom += ($m/$sum)*($n/($sum-1))*0.5;      # Dd x dd
$containsDom += ($n/$sum)*($m/($sum-1))*0.5;      # dd x Dd
$containsDom += ($m/$sum)*(($m-1)/($sum-1))*0.75; # Dd x Dd
print "$containsDom\n";

