#! /usr/bin/perl

#
# strano e non finito
#

@tabelle = ();

open(DB, $ARGV[0]);
@contenuto = <DB>;
close(DB);

foreach $linea (@contenuto) {
	@temp1 = split(/\(/, $linea);
	@temp2 = split(/\)/, $temp1[1]);
	@valori = split(/,/, $temp2[0]);

	$nomeTabella = $valori[0];
	$chiavePrimaria = $valori[1];
	$valore = $valori[2];
	
	$bool = 0;
	foreach $tabella (@tabelle) {
		if($tabella =~ /$nomeTabella/) {
			$bool = 1;
		}
	}
	if($bool == 0) {
		push(@tabelle, $nomeTabella);
		%$nomeTabella = ();
	}
	$$nometabella{$chiave} = $valore;
	print "$$nometabella{$chiave}\n"
}

foreach $nome (@tabelle) {
	print "$nome\n";
	foreach $chiave (keys %$nome) {
		print "$nome $chiave $$nome{$chiave}\n";
	}
}

















