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
elsif /^\d*(?:\.\d+)?/ !~ ARGV[0]
	puts "Parametri \"bruttotulo\" ei ole validi numero: #{ARGV[0]}."
	puts
	puts usage
	exit 3
end

kokonaisbruttotulo = ARGV[0].to_f

puts "Kokonaisbruttotulo: #{kokonaisbruttotulo}"

osuus_alle_30_000_eur = kokonaisbruttotulo >= 30000 ? 30000 : kokonaisbruttotulo

puts "Osuus alle 30 000 EUR: #{osuus_alle_30_000_eur}"

osuus_yli_30_000_eur = kokonaisbruttotulo >= 30000 ? (kokonaisbruttotulo - 30000) : 0

puts "Osuus yli 30 000 EUR: #{osuus_yli_30_000_eur}"

maksettava_vero_alle_30_000_eur_osuudesta = osuus_alle_30_000_eur * 0.30

puts "Maksettava vero alle 30 000 EUR osuudesta, veroprosentti 30: #{maksettava_vero_alle_30_000_eur_osuudesta}"

maksettava_vero_yli_30_000_eur_osuudesta = osuus_yli_30_000_eur * 0.34

puts "Maksettava vero yli 30 000 EUR osuudesta, veroprosentti 34: #{maksettava_vero_yli_30_000_eur_osuudesta}"

nettotulo_alle_30_000_eur_osuudesta = osuus_alle_30_000_eur - maksettava_vero_alle_30_000_eur_osuudesta

puts "Nettotulo alle 30 000 EUR osuudesta: #{nettotulo_alle_30_000_eur_osuudesta}"

nettotulo_yli_30_000_eur_osuudesta = osuus_yli_30_000_eur - maksettava_vero_yli_30_000_eur_osuudesta

puts "Nettotulo yli 30 000 EUR osuudesta: #{nettotulo_yli_30_000_eur_osuudesta}"

kokonaisnettotulo = nettotulo_alle_30_000_eur_osuudesta + nettotulo_yli_30_000_eur_osuudesta

puts "Kokonaisnettotulo: #{kokonaisnettotulo}"

