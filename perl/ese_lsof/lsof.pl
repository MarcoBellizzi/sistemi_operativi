#! /usr/bin/perl

if($ARGV[0] =~ /-r/) {
	@output = qx{lsof};
	open(FILE, '>lsof.out');

	if($ARGV[1] == -1) {
		foreach $linea (@output) {
			print FILE $linea;
		}
	}
	else {
		foreach $linea (@output) {
			@descrizione = split(/ +/, $linea);
			if($descrizione[0] =~ $ARGV[1]) {
				print FILE $linea;
			}
		}
	}
	close(FILE);
}
elsif($ARGV[0] =~ /-b/) {
	open(FILE, "<$ARGV[2]");
	@input = <FILE>;	
	close(FILE);

	if($ARGV[1] == -1) {
		%somme = ();
		foreach $linea (@input) {
			@parametri = split(/ +/, $linea);
			if(! exists $somme{$parametri[0]}) {
				$somme{$parametri[0]} = 0;
			}
			$somme{$parametri[0]} += $parametri[6];
		}
		foreach $chiave (keys %somme) {
			print "$chiave --> $somme{$chiave}\n";
		}
	}
	else {
		$somma = 0;
		foreach $linea (@input) {
			@parametri = split(/ +/, $linea);
			if($parametri[0] =~ $ARGV[1]) {
				$somma += $parametri[6];
			}
		}
		print "$ARGV[1] --> $somma\n";
	}
}














