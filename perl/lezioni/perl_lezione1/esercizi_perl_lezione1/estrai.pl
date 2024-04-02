#!/usr/bin/perl

# stampa su un nuovo file, estratto.txt, il contenuto del file /etc/passwd dalla ventesima alla trentesima riga 
open(FILE, "/etc/passwd");
open(WFILE, ">estratto.txt");

@contenuto=<FILE>;

$from = 20;
$to = 30;

$numero_linea=0;

foreach $linea (@contenuto)
{
 $numero_linea++;
 if ($numero_linea < $from) 
 {
  next;
 }
 
 last if ($numero_linea > $to);
 print WFILE "$linea\n";
} 

close (FILE);
close (WFILE);
