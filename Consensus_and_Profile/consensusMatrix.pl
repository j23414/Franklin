#! /usr/bin/env perl

use strict;
use warnings;
#use List::UtilsBy qw(max_by);

my $seq_name="";
my $seq="";
my %PL;   # Position and Letter
my %L=(); # Letter
my $c=""; # letter;

sub countLetters(){
#    print "$seq_name\t$seq\n";
    for(my $i=0; $i<length($seq); $i++){
	$c=substr($seq,$i,1);
	$PL{$i}{$c}++;
	$L{$c}++;
#	print "$i:",$PL{$i}{substr($seq,$i,1)},"\n";
    }
}

while(<>){
    chomp;
    if(/>(.+)/){
	if(length($seq_name)!=0){
	    countLetters();
	}
	$seq_name=$1;
	$seq="";
    }else{
	$seq=$seq.$_;
    }
}
if(length($seq_name)!=0){
    countLetters();
}

my $matrix="";

for my $key (sort keys %L){
    $matrix=$matrix."$key:";
    for(my $i=0; $i<length($seq); $i++){
	if(!exists $PL{$i}{$key}){
	    $PL{$i}{$key}=0;
	}
	$matrix=$matrix." $PL{$i}{$key}";
    }
    $matrix=$matrix."\n";
}

for(my $i=0; $i<length($seq); $i++){
    my @heights = sort { $PL{$i}{$a} <=> $PL{$i}{$b} } keys $PL{$i};
    my $highest = $heights[-1];
    print "$highest";
}
print "\n";
print $matrix;
