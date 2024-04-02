#!/usr/bin/perl

# stampa su un nuovo file, utenti.txt, il numero di utenti che utilizzano la shell /bin/bash 
# la statistica è calcolata in base alle informazioni disponibili nel file /etc/passwd

open (FILE, "/etc/passwd");
@contenuto=<FILE>;

$cont=0;

foreach $linea (@contenuto)
{
 chomp $linea;
 @pezzi=split(':',$linea);

 if( $pezzi[$#linea] eq "/bin/bash")
 { 
  $cont++;
 }

} 
 print "numero di utenti che usano bash $cont\n";
 close (FILE);
 
 open(WFILE, ">utenti.txt");
 print WFILE "numero di utenti che usano bash $cont\n";
 close (WFILE);
