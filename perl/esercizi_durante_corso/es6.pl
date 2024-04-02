#! /usr/bin/perl

%array = ( 
	A => 1 ,
	B => 2
);

print "Value $array{A}\n";

$array{C} = 3;
$array{D} = 4;
$array{E} = 5;
$array{F} = 6;

$array{A} = 0;

@valori = values %array;
@chiavi = keys %array;

print "@valori \n";
print "@chiavi \n";

print "si C\n" if exists $array{C};


