#! /usr/bin/env perl

use strict;
use warnings;

my $seq_name="";
my %GC=();
my $seq="";

sub GCpercent(){
    $GC{$seq_name}=()=$seq=~ /[GC]/gi;
    $GC{$seq_name}=$GC{$seq_name}/length($seq)*100;
}

while(<>){
    chomp;
    if(/^>(.+)/){
	if(length($seq_name)!=0){
	    GCpercent();
	}
	$seq_name=$1;
	$seq="";
#	print "$seq_name\n";
    }elsif(length($seq_name)!=0){
	$seq=$seq.$_;
	$seq=~ s/\s//g;
    }
}
GCpercent();
for my $key (sort{$GC{$b} <=> $GC{$a} } keys %GC){
    print "$key\t$GC{$key} %\n";
}
