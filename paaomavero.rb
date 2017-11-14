#!/usr/bin/env ruby

# Pääomatulon veroprosentti vuonna 2017 on 30, 30 000 euroa ylittävältä osalta 34. [https://www.veronmaksajat.fi/Palkka-ja-elake/Veroprosentit/veroprosentit-2017/]

def usage() 
<<USAGE
Käyttö::
./paaomavero bruttotulo

Parametrin "bruttotulo" tulee olla numero.

Esimerkkejä:
./paaomavero 50000
./paaomavero 32556.63
USAGE
end

if ARGV.length == 0 then
        puts "Pakollinen syötearvo puuttuu."
        puts
        puts usage
        exit 1
elsif ARGV.length > 1 then 
	puts "Liikaa syötearvoja."
        puts
        puts usage
        exit 2
end

kokonaisbruttosumma = ARGV[0].to_i

if kokonaisbruttosumma.to_s != ARGV[0] then
	puts "Parametri \"bruttotulo\" ei ole validi numero: #{ARGV[0]}."
	puts
	puts usage
	exit 3
end

puts "Kokonaisbruttosumma: #{kokonaisbruttosumma}"
