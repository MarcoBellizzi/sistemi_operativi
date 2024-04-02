#!/usr/bin/perl

print "Inserisci una variabile\n";
$input = <STDIN>; #lettura da input

chomp $input; #rimozione /n finale da una variabile

print "$input\n";

funzione();
funzione("ciao");

sub funzione {
	print "Funzione\n";
	$inputFunzione = shift;
	print "$inputFunzione";

}
