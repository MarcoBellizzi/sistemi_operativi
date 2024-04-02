#!/usr/bin/perl

# questo programma esegue una statistica circa gli abbinamenti shell-utente.
# tale statistica viene fatta dando una occhiata al file /etc/passwd


open(FILE,'/etc/passwd');

foreach $linea (<FILE>)
{
    chomp $linea;
    @elementi = split(':',$linea);

    #$abbinamenti{$elementi[6]}++;

    $abbinamenti{ $elementi[ @elementi - 1] }++;
}
foreach $chiave (keys %abbinamenti)
{
	print "$chiave=$abbinamenti{$chiave}\n";
}
close(FILE);
