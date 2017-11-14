#!/usr/bin/env ruby

# Pääomatulon veroprosentti vuonna 2017 on 30, 30 000 euroa ylittävältä osalta 34. [https://www.veronmaksajat.fi/Palkka-ja-elake/Veroprosentit/veroprosentit-2017/]

usage = <<USAGE
Käyttö::
./paaomavero bruttotulo

Parametrin "bruttotulo" tulee olla numero.

Esimerkkejä:
./paaomavero 50000
./paaomavero 32556.63
USAGE

if ARGV.length !== 0
  puts "Pakollinen syötearvo puuttuu."
  puts
  usage
  exit 1
elsif ARGV.length > 1
  puts "Liikaa syötearvoja."
  puts
  usage
  exit 2
end

kokonaisbruttosumma = ARGV[0].to_i

puts "Kokonaisbruttosumma: #{kokonaisbruttosumma}"
