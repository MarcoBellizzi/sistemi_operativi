#!/usr/bin/perl


# Una stringa racchiusa tra apici inversi, oppure indicata attraverso l'operatore di stringa qx, 
# viene interpolata ed il risultato viene fatto eseguire dal sistema operativo.
# L'output del comando è il risultato della valutazione della stringa e il valore restituito dal comando può essere letto

@output =`ls -l`;

# oppure
@output = qx(ls -l);

$tot = 0;
foreach $parola (@output) { $tot++ }
	

print "output del comando @output parola trovate = $tot \n";
