#! /usr/bin/perl

@output = qx{cat /proc/meminfo};
@temp = split(/ +/, $output[1]);
$memoriaPrec = $temp[1];

@differenze = ();
@positivi = ();
@negativi = ();

$i = 1;

open(FILE, '>>mem_free.log');

while(True) {
	@output = qx{cat /proc/meminfo};
	@temp = split(/ +/, $output[1]);
	$memoriaCorr = $temp[1];

	$differenza = $memoriaCorr - $memoriaPrec;
	push(@differenze, $differenza);
	
	if($differenza > 0) {
		print "> $differenza kB\n";
	}
	elsif($differenza == 0) {
		print "= 0 kB\n";
	}
	else {
		print "< $differenza kB\n";
	}

	if($i == 5) {
		for($j=0; $j<5; $j+=1) {
			print "tolto";
			pop(@positivi);   # non so perchè non li rimuove ( @positivi = () )
			pop(@negativi);
		}
		foreach $diff (@differenze) {
			if($diff > 0) {
				push(@positivi, $diff);
			}
			if($diff < 0) {
				push(@negativi, $diff);
			}
		}
		print FILE "i\n";
		foreach $pos (@positivi) {
			print FILE "$pos, ";
		}
		print FILE "\nd\n";
		foreach $neg (@negativi) {
			print FILE "$neg, ";
		}
		print FILE "\n--------\n";
		$i = 0;
	}
	$i += 1;
	$memoriaPrec = $memoriaCorr;
	sleep(1);
}




