#!/usr/bin/perl

#####################################
########  VARIABILI SCALARI  ########   
#####################################


# Perl è un linguaggio scarsamente tipizzato: non c'è una rigida distinzione fra i vari tipi di dati che possono essere utilizzati.
# Il valore 5 non differisce dalla stringa di testo "5". Perl all'occorrenza trasforma il numero in stringa e la stringa in numero in modo da poter utilizzare il dato nel contesto in cui lo si sta utilizzando. Ad esempio, se il contesto è una concatenazione di stringhe, Perl trasforma il numero 5 nella stinga di testo "5".

# I nomi di variabile sono preceduti da un simbolo che ne definisce il contesto:
#  $  precede i nomi delle variabili scalari
#  @  precede i nomi degli array
#  %  precede i nomi degli array associativi
#  &  precede i nomi delle funzioni (chiamata di funzione)


$numero = 2;

$stringa = 'testo';

print "numero= $numero, stringa= $stringa \n";

$numero++;

print "numero= $numero \n";


#
# Operazioni e assegnazioni 
#

# Somma 1 e 2 e salva il risultato in $a
$a = 1 + 2;     

# Sottrae 4 da 3 e salva in $a   
$a = 3 - 4;     

# Moltiplica 5 e 6   
$a = 5 * 6;     

# Divide 7 per 8 ottenendo 0.875   
$a = 7 / 8;     

# Nove alla decima   
$a = 9 ** 10;   

# Il resto di 5 diviso 2   
$a = 5 % 2;     

# Incrementa di uno $a, poi restituisce il suo valore   
++$a;           
# Restituisce il valore di $a, poi incrementa $a
$a++;           
   
# Decrementa, poi restituisce
--$a;          
# Restituisce, poi decrementa 
$a--;      

$a = 'testo1';
$b = 'testo2';
$c = 3;

# Concatena $a e $b
$str_conc = $a . $b; 

# $b ripetuta $c volte
$str_rip = $b x $c;   

print "str_conc = $str_conc \n";

print "str_rip $str_rip \n";

#
# Interpretazione delle stringhe 
#
# Le doppie virgolette forzano l'interpretazione di tutti i codici presenti all'interno, i nomi di variabile vengono sostituiti con il contenuto associato. Altri codici che vengono sostituiti sono i caratteri speciali come newline (\n), tab (\t), etc ..

$a = 'mele';

$b = 'pere';

print $a.' e '.$b. '\n ';

print '$a e $b \n '; 

print "$a and $b \n";




