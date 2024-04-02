#! /usr/bin/perl

$s1 = <STDIN>;
$s2 = <STDIN>;

chomp $s1; # rimuove il finestringa

$stot = $s1 . $s2 ;

$length = length($stot) -1;

$substr = substr($stot, $length/2, $length/2);

print($substr);
