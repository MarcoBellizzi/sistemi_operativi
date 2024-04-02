#!/usr/bin/perl

$lettera = 'A';

for($i=0; $i<8; $i++) {

	open(GIRONE, "gironi/girone$lettera/risultati.txt");

	$lettera++;

	$prima_riga = <GIRONE>;

	@squadre = split(' ', $prima_riga);

	%risultati = ();

	$risultati{$squadre[3]} = 0;
	$risultati{$squadre[4]} = 0;
	$risultati{$squadre[5]} = 0;
	$risultati{$squadre[6]} = 0;

	$prima_riga = <GIRONE>;

	foreach $partita (<GIRONE>) {
		@temp = split(/=/, $partita);

		@squa = split(/-/, $temp[0]);

		@ris = split(/-/, $temp[1]);

		if($ris[0] > $ris[1]) {
			$risultati{$squa[0]} += 3;
		}
		if($ris[0] < $ris[1]) {
			$risultati{$squa[1]} += 3;
		}
		if($ris[0] == $ris[1]) {
			$risultati{$squa[0]} += 1;
			$risultati{$squa[1]} += 1;
		}
	}

	$max1 = 0;
	$s1 = '';

	$max2 = 0;
	$s2 = '';

	foreach $chiave (keys %risultati) {
		if($risultati{$chiave} > $max1) {
			$max2 = $max1;
			$s2 = $s1;
			$max1 = $risultati{$chiave};
			$s1 = $chiave;
		}
		else {
			if($risultati{$chiave} > $max2) {
				$max2 = $risultati{$chiave};
				$s2 = $chiave;
			}
		}
	}

	print "passano agli ottavi $s1 con $max1 punti e $s2 con $max2 punti\n";

	close(GIRONE);

}


