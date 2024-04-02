#! /urs/bin/perl

$kill = $ARGV[0];
$name = $ARGV[1];

if($kill =~ /--kill=true/) {
	if($name =~ /--name=ALL/) {
		print "non è possibile killare tutti i processi\n";
	}
	elsif($name =~ /--name=\w+/) {
		@temp = split(/=/, $name);
		$processo = $temp[1];
		@output = qx{ps aux};
		@pid = ();
		foreach $linea (@output) {
			if($linea =~ /$processo/) {
				print $linea;
				@parole = split(/ +/, $linea);
				push(@pid,$parole[1]);
			}
		}
		qx{kill @pid};
	}
}
elsif($kill =~ /--kill=false/) {
	if($name =~ /--name=ALL/) {
		@output = qx{ps aux};
		print "@output";
	}
	elsif($name =~ /--name=\w+/) {
		@temp = split(/=/, $name);
		$processo = $temp[1];
		@output = qx{ps aux};
		$cpu = 0.0;
		$mem = 0.0;
		foreach $line (@output) {
			if($line =~ /$processo/) {
				@temp = split(/ +/, $line);
				$cpu += $temp[2];
				$mem += $temp[3]; 	
			}
		}
		print "processo $processo -> \%cpu = $cpu , \%mem = $mem\n";
	}
}

















