#! /usr/bin/env perl

use strict;
use warnings;

if(@ARGV<2){
    print "USAGE: ./overlap.pl 3 DATA/sample.txt\n";
    print "  arg1 = suffix or prefix overlap\n";
    print "  arg2 = FASTA file\n";
    exit;
}

my $k=$ARGV[0];

my %fasta;

open(my $fh, '<:encoding(UTF-8)', $ARGV[1])
    or die "Can't open > $ARGV[1]: $!";

my $seq="";
my $name="";

sub checkOverlap(){
    my $pre  = substr($seq,0,$k);
    my $post = substr($seq,length($seq)-$k,$k);
    # print "$name $seq $pre $post\n";  # DEBUG
    foreach my $key (keys %fasta){
	if($pre eq substr($fasta{$key},length($fasta{$key})-$k,$k)){
	    print "$key $name\n";
	}
	if($post eq substr($fasta{$key},0,$k)){
	    print "$name $key\n";
	}
    }
}

while(<$fh>){
    chomp;
    if(/^>(.+)/){
	if(length($name)>0){
	    checkOverlap();
	    $fasta{$name}=$seq;
	}
	$name=$1;
	$seq="";
    }else{
	$seq=$seq.$_;
    }
}
if(length($name)>0){
    checkOverlap();
    $fasta{$name}=$seq;
}

