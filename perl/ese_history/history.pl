#! /usr/bin/perl

open(FILE, '<history.log');
@history = <FILE>;
close(FILE);

if($#ARGV == -1) {
	foreach $linea (@history) {
		print $linea;
	}
}
elsif($#ARGV == 0) {
	if($ARGV[0] eq '--sort') {
		foreach $linea (sort @history) {
			print $linea;
		}
	}
	elsif($ARGV[0] eq '--stat') {
		%comandi = ();
		foreach $linea (@history) {
			chomp $linea;
			@temp = split(/ /, $linea);
			if(not exists $comandi{$temp[0]}) {
				$comandi{$temp[0]} = 0;
			}
			$comandi{$temp[0]} += 1;
		}
		foreach $chiave (keys %comandi) {
			print "$chiave --> $comandi{$chiave}\n";
		}
	}
	else {
		print "sono ammessi solo i parametri --sort, --stat, -f [comando]\n";
	}
}
elsif($#ARGV == 1) {
	if($ARGV[0] eq '-f') {
		foreach $linea (@history) {
			if($linea =~ /$ARGV[1]/) {
				print $linea;
			}
		}
	}
	else {
		print "sono ammessi solo i parametri --sort, --stat, -f [comando]\n";
	}
}


















