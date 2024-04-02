#! /usr/bin/perl

%cpu = ();
%memoria = ();

@output = qx{top -n 1 -b | tail -n +7};

open(FILE, '>>top_stat.log');

if($#ARGV == -1 or ($#ARGV == 0 and $ARGV[0] eq '-c')) {
	$i = 0;
	foreach $linea (@output) {
		if($i == 1) {
			@temp = split(/ +/, $linea);
			if(not exists $cpu{$temp[2]}) {
				$cpu{$temp[2]} = 0;
			}
			$cpu{$temp[2]} += $temp[9];
		}
		else {
			$i = 1;
		} 
	}
	print "USER --> \%cpu\n";
	print FILE "USER --> \%cpu\n";
	foreach $chiave (keys %cpu) {
		print "$chiave --> $cpu{$chiave}\n";
		print FILE "$chiave --> $cpu{$chiave}\n";
	}
	print FILE "##########\n";
}
elsif($#ARGV == 0 and $ARGV[0] eq '-m') {
	$i = 0;
	foreach $linea (@output) {
		if($i == 1) {
			@temp = split(/ +/, $linea);
			if(not exists $memoria{$temp[2]}) {
				$memoria{$temp[2]} = 0;
			}
			$memoria{$temp[2]} += $temp[10];
		}
		else {
			$i = 1;
		} 
	}
	print "USER --> \%mem\n";
	print FILE "USER --> \%mem\n";
	foreach $chiave (keys %memoria) {
		print "$chiave --> $memoria{$chiave}\n";
		print FILE "$chiave --> $memoria{$chiave}\n";
	}
	print FILE "##########\n";
}
else {
	print "sono ammesse solo le opzioni -m e -c\n";
} 

close(FILE);





