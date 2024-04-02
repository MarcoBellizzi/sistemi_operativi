#!/usr/bin/perl

#
# SOSTITUZIONI
#

# Oltre a poter trovare se una stringa soddisfa una particolare espressione regolare, il Perl permette di fare sostituzioni basate sulle corrispondeze individuate. Il modo per fare questo è usare l'operatore s.

 $frase = "Università degli Studi della Calabria";
 print "PRIMA => $frase \n";
 $frase =~ s/degli/Degli/g;
 print "DOPO => $frase \n";

# Le variabili speciali $1,$2, etc possono essere usate nelle espressioni regolari o nelle sostituzioni mediante i codici speciali \1,...,\9. Per esempio: 

 $frase = "Università degli Studi della Calabria";
 print "PRIMA => $frase \n";
 # Rimpiazzerà ogni lettera maiuscola con la stessa lettera racchiusa tra i due punti ":"
 $frase =~ s/([A-Z])/:\1:/g;
 print "DOPO => $frase \n";

 $frase = "Università degli Studi della Calabria";
 print "PRIMA => $frase \n";
 $frase =~ s/(.*) (.*) (.*) (.*) (.*)/\5 \4 \3 \2 \1/g;
 print "DOPO => $frase \n";


#
# TRASFORMAZIONI
#

# La funzione tr permette una traduzione (translation) carattere per carattere. 

 $frase = "Università degli Studi della Calabria";
 print "PRIMA => $frase \n";
 # L'espressione sostituisce nella variabile $frase "U" con "O", "S" con "T", e "C" con "Z". 
 $frase =~ tr/USC/OTZ/;
 print "DOPO => $frase \n";

# Esempio (trasforma ciascuna lettera minuscola nella corrispondente lettera maiuscola)
 $frase = "Università degli Studi della Calabria";
 print "PRIMA => $frase \n";
 $frase =~ tr/a-z/A-Z/;
 print "DOPO => $frase \n";
    

