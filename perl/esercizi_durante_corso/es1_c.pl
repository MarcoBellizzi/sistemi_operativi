#!/usr/bin/perl

@array = ();

$cont = 0;

$value = <STDIN>;

while($value != -1) {
	$array[$cont] = $value;
	$cont = $cont + 1;
	$value = <STDIN>;
}

$cont = 0;
$somma = 0;

while($cont != $#array + 1) {
	$somma = $somma + $array[$cont];
	$cont = $cont + 1;
}

print "La somma è : $somma \n";

