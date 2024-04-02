#!/usr/bin/perl

##############################
########    ARRAY     ########   
##############################

print "ARRAY \n";

#
# variabile vettoriale
#
@cibo = ("mele", "pere", "uva");

# $cibo[2]  è una variabile scalare e viene identificata mediante il simbolo $
print "cibo pronto all'indice 2 = $cibo[2] \n";


push(@cibo, "biscotti");

push(@cibo, ("pane", "acqua"));

@altrocibo =("vino","birra");

push(@cibo, @altrocibo);

print "cibo pronto = @cibo \n";

$fame = pop(@cibo);     

print "fame = $fame \n";

print "cibo rimasto = @cibo \n";

# array vuoto
@array = ();


# In perl le variabili hanno un valore riferito al contesto in cui ci si trova. 
# Questo significa, per esempio, che un array può essere visto come: 
# una lista di elementi, il numero degli elementi contenuti, o una stringa contenente tutti i valori degli elementi contenuti.

# assegna un array ad una variabile scalare (assegna ad $l la lunghezza di @cibo)
$l = @cibo;

print "l vale = $l \n";

# sostituisce al nome dell'array una stringa che rappresenta i suoi elementi separati fra di loro da spazi
$c = "@cibo";

print "c vale = $c \n";

# l'indice dell'ultimo elemento di un array 
$last_index= $#cibo;

print "last index = $last_index \n";


# stampa di un array: 
# circondato da apici
print 'array tra apici = @cibo \n ';
# circondato da doppie virgolette    
print "\narray tra virgolette = @cibo \n";  


# Una funzione molto utile del Perl è split, che spezza una stringa in pezzi mettendoli in un array. 
# Per specificare cosa deve essere considerato come separatore si passa a questa funzione un'espressione regolare. 

$info = "root:x:0:0:root:/root:/bin/bash";
@dati = split( /:/, $info );
print "i dati sono  @dati\n";

