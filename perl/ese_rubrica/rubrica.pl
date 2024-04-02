#! urs/bin/perl

%contatti = ();

while(true) {
	$input = <STDIN>;
	@comando = split(/ /, $input);

	if($comando[0] =~ /-a/) {
		@parametri = split(/,/, $comando[1]);
		$chiave = $parametri[0].' '.$parametri[1];
		if($parametri[2] =~ /\d{10}/) {
			$contatti{$chiave} = $parametri[2];	
		}
		else {
			print "numero errato\n";
		}	
	} 

	if($comando[0] =~ /-d/) {
		@parametri = split(/,/, $comando[1]);
		$chiave = $parametri[0].' '.$parametri[1];
		chomp $chiave;
		if(! exists $contatti{$chiave}) {
			print "il conttato $chiave non esiste nella rubrica\n";
		}
		else {
			delete $contatti{$chiave};
		}
	}

	# ricerca solo per nome o per cognome
	if($comando[0] =~ /-s/) { 
		chomp $comando[1];
		print "contatti che soddisfano la ricerca\n";
		foreach $chiave (keys %contatti) {
			if($chiave =~ $comando[1]) {
				print "$chiave - $contatti{$chiave}";
			}
		}
	}
	
	if($comando[0] =~ /-e/) {
		open(FILE,'>contatti.vfc');
		print FILE "elenco contatti:\n";
		foreach $chiave (keys %contatti) {
			print "$chiave - $contatti{$chiave}";
		}
		close(FILE);
	}

	if($comando[0] =~ /-k/) {
		die;
	}

	print "elenco contatti:\n";
	foreach $chiave (keys %contatti) {
		print "$chiave - $contatti{$chiave}";
	}
}












