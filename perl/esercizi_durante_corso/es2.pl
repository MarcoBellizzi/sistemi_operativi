#! /usr/bin/perl

%elenco = (
Marco => '1234' ,
Domenico => '2345' ,
Gianni => '0000' );

print "$elenco{Marco}\n";
print "$elenco{Domenico}\n";
print "$elenco{Gianni}\n";

# key e value ?

@arrayValori = values %elenco;
@chiavi = keys %elenco;

print "@arrayValori\n";
print "@chiavi\n";

