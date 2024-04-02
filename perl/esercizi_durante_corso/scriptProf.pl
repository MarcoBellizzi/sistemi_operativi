#! /usr/bin/perl    # regex101.com sito per le espressioni regolari   oppure regexplabet.com

# fail2ban   cercare (software che fa banna gli spam)

-1

open(LOG, "<mail.ripulito.log");   # < vuol dire abilita alla lettura
# open(LOG, "tail -f /var/log/mail.log |");   apri il risultato del comando tail..

$sogliaspam = 5;
$tempodisqualifica = 10*60;  # 10 minuti

%dabandire = ();

while( $_ = <LOG> ) {   # legge una riga alla volta da log
	if($_ =~ /ciao/ ) {
		$ip = $1;
		$punteggio = $2;
		$dabandire{$ip} = $dabandire{$ip} + $punteggio;	 # = a $dabandire{$ip} += $punteggio
		if($dabandire{$ip} > $sogliaspam) {    # qx{..} invoca un comando shell
			qx{iptables -I INPUT -s $1 -j DROP};   # banna (firewall) approfondito in reti
			$banditi{$ip} = time();		
		}
		foreach $ip (keys %banditi) {
			if(time() - $banditi{$ip} > $tempodisqualifica ) {
				qx{iptables -D INPUT -s $ip -j DROP};
				delete $banditi{$ip};
			}
		}
	}	
}


espressioni regolari

\d  seleziona le cifre

[0-9] = \d 

. vuol dire una espressione che puo contenere qualsiasi cosa

\. vuol dire il carattere '.' 

[ .. ] range di lettere

( .. ) sequenza di lettere

"(.*?)"  il punto interrogativo blocca il .* alla prima chiusura dei doppi apici che incontra
		senza punto interrogativo il .* si chiama operatore "famelico" e cerca di prendere piu caratteri possibili cercando di arrivare fino alla fine della stringa


indirizzi ip

\d+\.\d+\.\d+\.\d+    



-2

$ARGV[0] || die "Primo argomento non presente \n";   # die serve a far morire il nostro script
$ARGV[1] || die "Secondo argomento non presente \n";

$email = $ARGV[1];

open(LOG, $ARGV[0]);

while( $linea =~ /MOVIDIMU/ ) {
	($ip , $data, $url) = ($1,$2,$3);   # assegna
	$visited{$ip}++;
	$datadi{$ip} = $data;
	$visitedrisorse{$url}++;

	# $nomehost = qx{host $ip};
	# $nomehost =~ /.* (.*)/;
	# nomedi{$ip} = $nomehost

	
}


open (MESSAGGIO, "| mail $email -s [Rapporto Web]");

print MESSAGGIO "Report Web di oggi \n";

foreach $visitatore (sort { $visitedi{$b} <=> $visitedi{$a}; } keys %visitedi {
	#qualcosa
}

close(MESSAGGIO);
























