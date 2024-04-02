#!/usr/bin/perl

print "Inserire il nome del processo da uccidere: ";

$input=<STDIN>;

chomp $input;

foreach $linea (qx "ps ax")
{
    @elem = split(' ',$linea);
    
    if($elem[4] eq $input)
    {
      print"Uccido il processo $elem[4] con PID $elem[0]\n";
     `kill $elem[0]`;
    }
}

