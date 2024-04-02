#!/usr/bin/perl


#########################################
########    ARRAY ASSOCIATIVI    ########   
#########################################

# Un normale array consente di "puntare" ai suoi elementi usando numeri interi come indici. 
# Un array associativo (o hashtable) consente di fare la stessa cosa utilizzando delle stringhe come indici (ovvero chiavi). L'idea è quella di associare tra loro coppie di stringhe: il dato vero e proprio e la chiave (o l'indice) che lo identifica. In particolare, si indicizza ogni coppia di valori dell'array mediante il primo elemento della coppia.
# Il nome di un array associativo viene preceduto dal simbolo %

 %info_persone = ('Michele', 39, 
		  'Marco Rossi', 34, 
		  "Rodolfo", "3",
   		  "Ciccio", 21, 
		  "PincoPallo detto Pinco Pallo", "ultracentenario -108-",
		   15, 0);

# Ora possiamo trovare l'età delle persone ...

 print "Michele ha ->  $info_persone{'Michele'} anni \n"; 
 print "Marco Rossi ha ->  $info_persone{'Marco Rossi'} anni \n";
 print "Rodolfo ha ->  $info_persone{\"Rodolfo\"} anni \n";   
 print "Ciccio ha ->  $info_persone{\"Ciccio\"} anni \n";  
 print "15 ha ->  $info_persone{15} anni \n";      
 print "PincoPallo detto Pinco Pallo ha ->  $info_persone{\"PincoPallo detto Pinco Pallo\"} anni \n";  


# Notare che per accedere ad un singolo elemento, il sibolo % è stato cambiato nel simbolo $ (come per gli array semplici dove @ viene sostituito da $ per accedere ad un singolo elemento).
# L'indice identificativo dell'elemento viene definito mediante le parentesi graffe (invece che tra parentesi quadre 
# come avviene per gli array semplici).


 %articolo = (
  'codice'      => 22,
  'nome'        => 'Cobra',
  'descrizione' => 'Coltello da collezione',
  'prezzo'      => 110000
 );


# Per visualizzare un valore si scrive:
 print "stampo il 'codice' dell'articolo = $articolo{'codice'}\n";

# Per impostarlo:
 $articolo{'codice'} = 15;
 print "stampo il nuovo 'codice' dell'articolo = $articolo{'codice'}\n";


# Esempio di assegnazione di un array associativo a un normale vettore:
 @array = %articolo;
# Per comprendere il risultato di questa assegnazione è necessario stampare i valori del vettore @array...
 print "contenuto del vettore: \n@array \n";


#
# Le funzioni key e values
#

# La funzione keys ritorna una lista di tutte le chiavi (indici simbolici) dell'array associativo. 
# La funzione values restituisce la lista di tutti i valori memorizzati nell'array associativo specificato. 
# Queste due funzioni ritornano le loro liste nello stesso ordine, ma questo ordine non ha niente a che vedere con l'ordine di inserimento degli elementi nell'array associativo. 


 @chiavi = keys(%info_persone);
 print "l'array delle chiavi = @chiavi\n";

 @valori = values %info_persone;
 print "l'array dei valori = @valori\n";

# In un contesto scalare, sia keys che values restituiscono il numero di chiavi/elementi presenti nell'array associativo.
 $num_chiavi = keys(%info_persone);
 print "Sono presenti $num_chiavi persone nell'array associativo"."\n";

 $num_valori = values(%info_persone);
 print "Sono presenti $num_valori età nell'array associativo"."\n";

# Stampa delle chiavi dell'array associativo
 print "\n";
 foreach $persona (keys %info_persone)
 {
   print "Conosco l'età di $persona\n";
 }
 print "\n";

# Stampa dei valori dell'array associativo
 foreach $anni (values %info_persone)
 {
   print "Qualcuno ha anni $anni\n";
 }
 print "\n";

# Stampa delle coppie chiave-valore dell'array associativo
 foreach $nome (keys %info_persone)
 {
    print "$nome ha $info_persone{$nome} anni\n";
 }
       
 print "\n";

# La funzione each restituisce una coppia di elementi dell'array associativo
 while (($persona, $anni) = each(%info_persone))
 {
   print "La persona $persona ha $anni anni\n";   
 }


                         
