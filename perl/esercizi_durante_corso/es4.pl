#! /usr/bin/perl

$stringa = <STDIN>;
chomp $stringa; # rimuove il finestringa

$char = <STDIN>;
chomp $char; # rimuove il finestringa

@campi = split(/$char/, $stringa);

print "$#campi\n";
