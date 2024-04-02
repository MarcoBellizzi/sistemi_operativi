#!/usr/bin/perl


#
# La fuznione di oridnamento sort
#

# sort consente di specificare una routine esplicita di ordinamento: 
# sort {$a cmp $b} 		 ordinamento lessicografico
# sort {$b cmp $a} 		 come prima ma in ordine inverso
# sort {$a <=> $b} 		 ordinamento numerico ascendente
# sort {$b <=> $a} 		 ordinamento numerico discendente


#
# Esempio 1
#
 %nomicompleti = (
           "Camus"      => "Albert",
           "Smith"      => "Renee",
           "Baudelaire" => "Charles",
           "Pierre"     => "Robes",
           "Smith"      => "Larry",        
           "Sartre"     => "Jean-Paul"
 );      


 print "\n*** Stampa ***\n";
 foreach $cognome  (keys %nomicompleti)
 {
   print "$nomicompleti{$cognome} $cognome\n";
 }
                                   

 print "\n*** Stampa ordinata per chiave (cognome) ***\n";
 foreach $cognome  (sort keys %nomicompleti)
 {
   print "$nomicompleti{$cognome} $cognome\n";
 }


 print "\n*** Stampa ordinata per chiave (cognome) ascendente ***\n";
 foreach $cognome (sort { $a cmp $b } keys %nomicompleti)
 {
   print "$nomicompleti{$cognome} $cognome\n";
 }

 print "\n*** Stampa ordinata per chiave (cognome) discendente ***\n";
 foreach $cognome (sort { $b cmp $a } keys %nomicompleti)
 {
   print "$nomicompleti{$cognome} $cognome\n";
 }

 print "\n*** Stampa ordinata in base al valore (nome) in corrispondenza della chiave ***\n";
 foreach $cognome (sort { $nomicompleti{$a} cmp $nomicompleti{$b} } keys %nomicompleti)
 {
   print "$nomicompleti{$cognome} $cognome\n";
 }


#
# Esempio 2:
#
 %studenti = ("ale", 10567, "cla", 1789, "adri", 6443, "mary",9890);


 print "\n*** Stampa ***\n";
 foreach $nome  (keys %studenti)
 {
   print "$nome - $studenti{$nome}.\n";
 }


 print "\n*** Stampa ordinata in base alla chiave (nome) ***\n";
 foreach $nome  (sort keys %studenti)
 {
   print "$nome - $studenti{$nome}.\n";
 }


 print "\n*** Stampa ordinata in base al valore (matricola), ascendente ***\n";
 foreach $nome  (sort { $studenti{$a} <=> $studenti{$b} } keys %studenti)
 {
   print "$nome - $studenti{$nome}.\n";
 }


 print "\n*** Stampa ordinata in base al valore (matricola), discendente ***\n";
 foreach $nome  (sort { $studenti{$b} <=> $studenti{$a} } keys %studenti)
 {
   print "$nome - $studenti{$nome}.\n";
 }

