#!/usr/bin/perl

#questo programma conta quanti byte occupa una cartella (non sono considerate le sottodirectory)

@output =`ls -l`;

$somma=0;

foreach $riga (@output)
{
 @contenuto=split(' ', $riga);
 $somma+=$contenuto[4];
}

print "somma = $somma\n";






