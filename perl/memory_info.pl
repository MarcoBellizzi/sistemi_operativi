#! /usr/bin/perl

@output = qx{cat /proc/meminfo};
$linea = $output[1];
@temp = split(/ +/, $linea);

print " $temp[1]\n";
