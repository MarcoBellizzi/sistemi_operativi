 #!/usr/bin/perl

$in1 = <STDIN>;
$in2 = <STDIN>;

somma($in1,$in2);
sottrai($in1,$in2);
moltiplica($in1,$in2);
dividi($in1,$in2);


sub somma {
	$f1 = shift;
	$f2 = shift;
	print $f1 + $f2;
	print "\n";
}
sub sottrai {
	$f1 = shift;
	$f2 = shift;
	print $f1 - $f2;
	print "\n";
}
sub moltiplica {
	$f1 = shift;
	$f2 = shift;
	print $f1 * $f2;
	print "\n";
}
sub dividi {
	$f1 = shift;
	$f2 = shift;
	print $f1 / $f2;
	print "\n";
}



