#! urs/bin/perl

if($ARGV[0] eq '--sync') {
	open(FILE, '>>database.db');
	@output = qx{ls -aR $ARGV[1]};
	foreach $linea (@output) {
		if((not $linea eq ".\n") and (not $linea eq "..\n") and (not $linea eq "\n")) {
			if($linea =~ /.*:/) {
				chomp $linea;
				chop $linea;
				$path = $linea;
			}
			else {
				print FILE "$path --> $linea";
			}
		}	
	}
	close(FILE);
}
else {
	open(FILE, '<database.db');
	@output = <FILE>;
	close(FILE);
	foreach $linea (@output) {
		@temp = split(/ --> /, $linea);
		if($temp[1] =~ $ARGV[0]) {
			print "$temp[0]/$temp[1]";
		}
	}
}





