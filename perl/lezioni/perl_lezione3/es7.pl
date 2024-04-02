#!/usr/bin/perl

##############################
#####  Pattern Matching  #####
##############################

# Una delle caratteristiche più utili del Perl è la possibilità di manipolare le stringhe mediante l'utilizzo di espressioni regolari. Una espressione regolare (REGEXP) definisce un pattern (percorso) che verrà ricercato all'interno di una stringa.
# Le espressioni regolari possono essere usate per fare “pattern matching” o “pattern substituition”, ovvero per vedere se una determinata stringa ha la forma desiderata, oppure per sostituirne alcune parti.
# Un'espressione regolare viene racchiusa tra due slash, ad esempio:
#	/QUI L'ESPRESSIONE REGOLARE/

# Gli elementi fondamentali di una espressione regolare sono: elementi e quantificatori. 
# Gli elementi rappresentano una parte di testo. 
# I quantificatori esprimono quante volte ci si aspetta che un certo elemento o gruppo di elementi possa essere ripetuto.
# Gli elementi più semplici sono i caratteri alfanumerici stessi, essi semplicemente rappresentano sé stessi. 
# L'espressione regolare /a/ indica che una stringa soddisfa il pattern se contiene almeno una una a.

# Un pattern matching si definisce mediante l' operatore di ricerca, m, del tipo:
# m/REGEXP/ 
# (normalmente sottinteso)

 $testo = "Oggi è una bella giornata!";
 if( $testo =~ m/la/)  
 {
   print "la stringa $testo verifica il match con /la/. \n";
 }

# Oppure (si sottintende l'operatore di matching m).
 if( $testo =~ /la/)
 {
   print "la stringa $testo verifica nuovamente il match /la/. \n";
 }

# L'operatore =~ verifica se esiste una corrispondenza tra una stringa ed una certa espressione regolare, avverte Perl che la parte successiva è una espressione regolare. Questo operatore si chiama operatore di binding, per il fatto che effettua una connessione (binding) fra la variabile $testo e l'espressione regolare /la/. 
# In sostanza, può essere letto come "applica l'espressione regolare a destra sul testo della variabile a sinistra". 
# Non si tratta di un'assegnazione!!

# L'operatore !~ è usato per rilevare una non corrispondenza.
 if( $testo !~ m/LA/)
 {
   print "la stringa $testo NON verifica il match /LA/. \n";
 }

# I modificatori di una REGEXP ne determinano il comportamento:
# /REGEXP[/SUBST]/g 	# g è il modificatore globale: sarà ricercata o sostituita ogni evenienza.
# /REGEXP[/SUBST]/i 	# i è il modificatore case-insensitive: l'espressione regolare sarà case-insensitive

 $testo = "Oggi è una bella giornata!";
 if( $testo =~ m/LA/i)
 {
   print "la stringa $testo verifica il match /LA/ case-insensitive. \n";
 }

# Come avviene la verifica di un match ??? 
# Viene cercata la posizione più a sinistra in cui si riscontra l’intera espressione regolare. La stringa viene esaminata da sinistra a destra finché non viene trovato un riscontro di regexp o finché il confronto fallisce. 


#
# CARATTERI SPECIALI, non rappresentano sé stessi!
#

#   |		# Rappresenta una alternativa, un "oppure"
#   []		# Classe di caratteri : corrispondenza con uno qualsiasi dei caratteri contenuti. 
		# All'interno si può usare il simbolo '-' posizionato tra i caratteri estremi, 
		# Inoltre si può usare il simbolo '^' se si desidera esprimere una negazione
#   ()		# Può essere usata per raggruppare assieme parti di una espressione regolare quando necessario

#   .  		# Qualsiasi carattere singolo escluso newline  
# {m,n}		# Almeno m ma non più di n occorrenze del carattere/(gruppo) precedente
# {n,}		# Almeno n occorrenze del carattere/(gruppo) precedente
# {n}		# Esattamente m occorrenze del carattere/(gruppo) precedente

#   *		# Zero o più occorrenze dell'ultimo carattere/(gruppo), {0,}
#   +		# 1 o più occorrenze dell'ultimo carattere/(gruppo), {1,}
#   ?		# Zero o una occorrenza dell'ultimo carattere/(gruppo), {0,1}

#   ^		# Inizio di stringa o di riga
#   $		# Fine di stringa o di riga

#   \ 		# Quota il carattere successivo
#   \n		# newline
#   \t		# tab    
#   \w		# Qualsiasi carattere alfanumerico, equivale a [a-zA-Z0-9_]
#   \W		# Qualsiasi carattere non alfanumerico, equivale a [^a-zA-Z0-9_]        
#   \d 		# Qualsiasi cifra, uguale a [0-9]
#   \D 		# Qualsiasi carattere non cifra, uguale a [^0-9]
#   \s  	# Qualsiasi carattere di spazio: spazio, tab, newline, etc.
#   \S  	# Qualsiasi carattere che  non è di tipo spazio


# Il carattere di escape '\' si usa all'interno di una espressione regolare per l'interpolazione delle stringhe .
# Ciò si richiede perchè caratteri come $, |, [, ), \, / e così via sono casi particolari nelle espressioni regolari. 
# Se si desidera richiedere una corrispondenza con uno di questi, allora bisogna farli precedere dal simbolo backslash,
# ad esempio:

#   \|    	# Barra verticale
#   \[    	# Quadra aperta
#   \)    	# Tonda chiusa
#   \*    	# Asterisco
#   \^    	# Casetta (carat)
#   \/    	# Barra (slash)
#   \\    	# Barra rovescia (backslash)  
#  etc... etc...

#
# ESEMPI:
#

#   o.a   		# "o" seguita da qualsiasi carattere seguito da "a". Soddisfatta da ora, oca, osa, ma non da oa, orma
#   ^f    		# "f" all'inizio di una riga
#   ^yogi 		# yogi all'inizio di una riga
#   e$    		# "e" alla fine di una riga
#   notte$   		# notte a fine riga
#   aiuto*   		# aiuto seguito da zero o più caratteri "o"   
#   .*  		# Qualsiasi stringa senza un newline. 
#   ^$  		# Una riga vuota.
#   [qjk]    		# Alternativamente q oppure j oppure k
#   [^qjk]   		# Nè q, nè j, nè k
#   [a-z]    		# Qualsiasi carattere tra a e z inclusi
#   [^a-z]   		# Nessuna lettera minuscola
#   [a-zA-Z] 		# Qualsiasi lettera
#   [a-z]+   		# Qualsiasi sequenza non vuota di lettere minuscole
#   arancia|limone 	# Alternativamente arancia o limone
#   cas(a|erma) 	# casa oppure caserma
#   (la)+       	# la oppure lala oppure lalala oppure ...


# Spesso è utile potersi ricordare dei pattern per cui c'è stato un match, così da poterli ri-utilizzare. 
# Ciò che avviene è che qualsiasi stringa che soddisfa un match è memorizzata da Perl nelle variabili speciali $1,...,$9. 
# In pratica, le variabili $1, $2, etc. funzionano all’esterno di un criterio di ricerca e contengono le sequenze effettivamente riscontrate nei vari raggruppamenti in () dell’espressione regolare e contate da sinistra a destra.
# Questo meccanismo consente di "catturare" singole parti dell'espressione regolare per cui si verifica il match. 

#
# Esempio 1: controllo della correttezza del codice fiscale del tipo:  MNL TMS 74 M 02 L736 Y
#


$stringa="MNL TMS 74 M 02 L736 Y";
$stringa=~m /([A-Z]{3})\s([A-Z]{3})\s(\d{2})\s([A-Z])\s(\d{2})\s([A-Z][0-9]{3})\s([A-Z])/;
# stampa di tutti i "pezzi" della stringa che hanno soddisfatto i match
print "Codice fiscale : $1 $2 $3 $4 $5 $6 $7 \n";

#
# Esempio 2: 
# 
# Si esegue il comando "date" di linux, per conoscere la data, si assegna l'output alla variabile implicita $_ e si verificano alcuni campi (ore,minuti, giorno, mese, anno). Il comando "date" restituisce la data secondo il seguente formato, ad esempio: "sab  5 nov 2011, 16.15.43, CET"

 $_=`date`;
 m/(\w+)\s*(\d+)\s(\w+)\s(\d+)\,\s(\d+)\.(\d+)\.(\d+)\,\sCET/;
 print "Sono le ore $5 e $6 minuti del $2 $3 $4\n";


# Il meccanismo dei quantificatori è “ingordo”, ovvero Perl esamina la sequenza con il numero massimo possibile di atomi riscontrati. Se questa sequenza non soddisfa l’espressione regolare allora diminuisce di 1 il numero di atomi fino al minimo consentito finché non riesce a soddisfare l’espressione regolare.

#
# Esempio 3:
#
 $testo =' "Ciao!", gli disse lei, "Ciao." rispose lui.';
 $testo =~ /"(.+)"/; 
 # L'operazione che segue stampa: Ciao!”, gli disse lei, “Ciao.
 print "$1\n";


# Posticipando il carattere ? ad un quantificatore lo si rende quantificatore minimale, ovvero verrà cercata la prima occorrenza possibile del carattere/gruppo, minimizzando il risultato

 $testo =~ /"(.+?)"/; 
 # L'operazione che segue stampa: Ciao!
 print "$1\n";

#
# Esempio 4:
#
 $string = "aaaabbbaaaaabbbaaaa";
 $string =~ /(.*)bbb/;
 # La sequenza riscontrata è “aaaabbbaaaaabbb”
 print "$1\n";
 # Se si vuole che la sequenza riscontrata sia “aaaabbb” si deve scrivere
 $string =~ /(.*?)bbb/;
 # In questo modo con ? dopo il quantificatore * si parte dall’esame della sequenza con il numero minimo di atomi di tipo punto (.)
 print "$1\n";

