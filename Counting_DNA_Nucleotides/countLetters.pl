#! /usr/bin/env perl

use strict;
use warnings;

# pipe data to perl script

my %letters;
while(my $char=getc){
#    print "c:$char\n";
    $letters{$char}++;
}

for my $key (sort keys %letters){
    print "$key\t$letters{$key}\n";
}
