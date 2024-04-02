#!/usr/bin/perl

$sale = $ARGV[$0];

open(PASSEGGERI, 'passeggeri.txt');

@passeggeri = <PASSEGGERI>;

close(PASSEGGERI);

%biglietto = ();
%fermata = ();

foreach $linea (@passeggeri) {
	@contenuto = split(' ', $linea);
	$biglietto{$contenuto[0]} = $contenuto[1];
	$fermata{$contenuto[0]} = $contenuto[2];
}

print "passeggeri furbi: ";

foreach $chiave(keys %biglietto) {
	if($biglietto{$chiave} eq 'no' && $fermata{$chiave} <= $sale) {
		print "$chiave ";
	}
}
print "\n";

open(BUS, '>newBus.txt');

for($i=1; $i<49; $i++) {
	if($fermata{$i} <= $sale) {
		print BUS "_ ";
	}
	else {
		if($biglietto{$i} eq 'si') {
			print BUS "* ";
		}
		else {
			print BUS "X ";
		}
	}
	if (($i % 12) == 0) {
		print BUS "\n";
	}
}

close(BUS);




