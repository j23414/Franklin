#! /usr/bin/env perl

use strict;
use warnings;

my $num_args=$#ARGV+1;
if($num_args!=2){
    print "\nUSAGE: rabbits.pl 5 3\n";
    print "\t arg1 = number of generations\n";
    print "\t arg2 = pairs of children each generation\n";
    exit;
}

my $gens = $ARGV[0]; 
my $kids = $ARGV[1]; 

my $one  = 0;     # number of rabbits one generation before
my $rabbits=1;

my $temp=0;

#print "1\t$rabbits\n";
for (my $i=2; $i <= $gens; $i++){
    $temp=$rabbits+($one*$kids);
    $one=$rabbits;
    $rabbits=$temp;
#    print "$i\t$rabbits\n";
}

print "$rabbits\n";


