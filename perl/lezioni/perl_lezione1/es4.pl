#!/usr/bin/perl

 ############################################
 ######   STRUTTURE DI CONTROLLO     ########   
 ############################################


 
 #
 # FOREACH e FOR
 #
 @cibo=("mele","pere","uva");

 # Visita un elemento per volta
 foreach $boccone (@cibo)         
 {
      print "$boccone ";
 }
 print "\n";
 for ($i = 0; $i<=$#cibo; ++$i)
 {
      print "$cibo[$i] ";
 }
 print "\n";

 #
 # WHILE E UNTIL
 #
 
 print "Inserisci un intero maggiore di 3.. \n";   
 $a = <STDIN>;
 chomp $a; 

 # Finchè l'ingresso è sbagliato...   
 while ($a <= 3) 
 {
    # Ripeti la richiesta
    print "Sbagliato: riprova! \n";

    # Leggi di nuovo l'ingresso
    $a = <STDIN>;
    chomp $a;
 }
 print "OK! Hai inserito $a! \n";

 # oppure :

 do
 {
    # Chiedi l'ingresso
    print "Inserisci un intero maggiore di 3.. \n";   
    
    # Leggi l'ingresso
    $a = <STDIN>;
    # Elimina il newline
    chomp $a;
 }
 # Se l'ingresso è sbagliato, ripeti
 while ($a <=3 );
 print "OK! Hai inserito $a! \n";

 # All'interno delle istruzioni di un ciclo possono apparire alcune istruzioni particolari:
 # next : interrompe l'esecuzione del gruppo di istruzioni e riprende dalla valutazione della condizione 
 # last : esce definitivamente dal ciclo senza curarsi del gruppo di istruzioni

 $sum= 0;
 while () {
    print "inserisci un numero da sommare (positivo) \n";
    $num=<STDIN>;

    if ($num < 0) 
    {
     print "salta il numero negativo \n";
     next;
    }

    $sum+=$num;
    if ( $sum >= 20 ) 
    {
       last;
    }
    # last if ($sum >=20);
  } 
 print "la somma dei numeri positivi inseriti è $sum \n";


 #
 # Valori di verità. L'operatore == (!=) è usato per verificare una condizione di uguaglianza (diseguaglianza) tra interi, 
 # mentre l'operatore eq (ne) è usato per verificare una condizione di uguaglianza (diseguaglianza) tra stringhe 
 # 
 # E` $a numericamente uguale a $b?
 # $a == $b                
 # E` $a numericamente diverso da $b?   
 # $a != $b

 # E` $a uguale come stringa a $b?   
 # $a eq $b
 # E` $a diverso come stringa da $b?
 # $a ne $b 


 # 
 # operatori logici and, or e not:
 #
 # Sono $a e $b contemporaneamente veri?
 # ($a && $b)
 # E` vero almeno uno dei due?
 # ($a || $b)
 # $a è falso?
 # !($a)


