#! /usr/bin/env perl

use strict;
use warnings;

my $s="";
my @arr;

my %LC;         # Letters Complement
$LC{'A'}='T';
$LC{'C'}='G';
$LC{'G'}='C';
$LC{'T'}='A';
$LC{'a'}='t';
$LC{'c'}='g';
$LC{'g'}='c';
$LC{'t'}='a';

while(<>){
    chomp;
    $s=reverse($_);
    @arr=split //,$s;
    foreach my $c (@arr){
	print $LC{$c};
    }
    print "\n";
}
