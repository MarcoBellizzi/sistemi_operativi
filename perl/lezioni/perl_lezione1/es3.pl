#!/usr/bin/perl

 ##############################
 ########    FILE     #########   
 ##############################
 

 # La funzione open apre un file. 
 # Il primo argomento è l'handle (l'identificatore di file) che permetterà in seguito di riferirsi al file aperto. 
 # INFO, nell'esempio che segue, è un filehandle, ovvero un simbolo attraverso il quale si ha accesso al contenuto di un file. 
 # Il secondo argomento è invece il nome del file da aprire.
 # La funzione close dice al Perl che non serve più l'accesso a quel file.

 $file = 'nomeFile.txt'; 
 open(INFO, $file);

 # <nome_handle> legge il file associato a "nome_handle" nell'array @righe. 
 # In questo modo il file viene letto tutto in una volta. 
 # Questo succede perchè la lettura avviene nel contesto di una varabile array. 

 @righe = <INFO>;
 print "*** array di righe contenente il file ***\n@righe\n";
 close(INFO);

 # Se invece @righe venisse sostituito dalla variabile scalare $riga, verrebbe letta solo una riga. 
 # In entrambi i casi ogni riga viene memorizzata completa con il suo carattere di newline alla fine. 

 open(INFO, $file);
 $riga = <INFO>; 
 print "*** riga contenente la prima riga del file ***\n$riga\n";

 # Chiude il file
 close(INFO);


 # La funzione open ritorna un "false" in caso di problemi e imposta la variabile speciale $! che contiene il 
 # motivo indicato dal sistema operativo (es: file inesistente , non posso aprire il file, etc...)

 # if ( ! open ( FILEINESISTENTE , "pippo.txt" ) )
 # {
 #  die ( "Non è stato possibile aprire il file pippo.txt : $!" ); 
 # }

 # oppure:

 # open ( FILEINESISTENTE , "pippo.txt" ) || die ( "Non è stato possibile aprire il file pippo.txt" ); 


 # La funzione open può anche specificare un file da usare per salvare o appendere i dati in uscita, 
 # oltre che per leggere dati in ingresso

 # Apre in lettura
 open(INFO, $file);
 # Altro modo per aprire in lettura
 open(INFO, "<$file");
 close(INFO);

 $new_file="newFile.txt";
 # Apre in scrittura
 open(NEWFILE, ">$new_file");
 
 # Apre per appendere l'uscita
 open(NEWFILE, ">>$new_file");
 
 # Per scrivere su un file aperto in scrittura, si può usare il comando print con un argomento addizionale. 
 print NEWFILE "Scrivo questa riga nel file.\n";

 # Ricordarsi di chiudere per rendere effettiva la scrittura
 close(NEWFILE);

 #
 # STDIN STDOUT STDERR
 #
 # Esistono tre filehandle che ogni programma Perl trova automaticamente aperti all'inizio dell'esecuzione: STDIN, STDOUT e STDERR 
 # (rispettivamente il canale di input, output ed output di errore)

 print "dormi? \n";
 # Legge la successiva riga inserita da standard input
 $line = <STDIN>;                   

 print "la linea ricevuta su standard input :\n$line";

 print "inserisci le righe successive !!!!!!!\n";

 # Legge tutte le righe inserite da standard input fino all'inserimento di ^D
 @lines = <STDIN>;                   
                                  
 print "Le restanti linee ricevute su standard input :\n@lines";


 #
 # ARGOMENTI DA LINEA DI COMANDO MEDIANTE @ARGV
 #

 print "argomenti :\n";
 for ($i=0; $i<= $#ARGV;$i++)
 {
   print "$ARGV[$i] ";
 }
 print "\n";


 #
 # CHOP e CHOMP
 #

 # chomp si usa per eliminare il codice di interruzione di riga finale che accompagna i valori inseriti.
 # chop molto più rudemente procede a rimuovere l'ultimo carattere della stringa qualunque esso sia. 


 $a = "pippo\n";

 chop($a); 
 print "valore della variabile pippo dopo il primo chop : $a\n";
 
 chop($a); 
 print "valore della variabile pippo dopo il secondo chop : $a\n";
 
 $a = "pluto\n";

 chomp($a); 
 print "valore della variabile pluto dopo il primo chomp : $a\n";

 chomp($a); 
 print "valore della variabile pluto dopo il secondo chomp : $a\n";
