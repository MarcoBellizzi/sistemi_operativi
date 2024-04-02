#! /usr/bin/perl

$stringa = <STDIN>;

print funzione($stringa);

sub funzione {
	$stringa = shift;
	$nuova = "";
	$cont = -2;
	while($cont != -length($stringa)-1) {
		$nuova = $nuova . substr($stringa,$cont,1);
		$cont = $cont - 1;	
	}
	return $nuova."\n";
}

