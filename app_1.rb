require 'bundler'
Bundler.require
require "pry"


require_relative 'lib/Board'
require_relative 'lib/BoardCase'
require_relative 'lib/Game'
require_relative 'lib/Player'


puts "Deux joueurs s'affrontent. Ils doivent remplir chacun à leur tour une case de la grille avec le symbole qui leur est attribué : O ou X. Le gagnant est celui qui arrive à aligner trois symboles identiques, horizontalement, verticalement ou en diagonale. 
Il est coutume de laisser le joueur jouant X effectuer le premier coup de la partie."

puts "           "
puts " 1 | 2 | 3"
puts "---+---+---"
puts " 4 | 5 | 6"
puts "---+---+---"
puts " 7 | 8 | 9"
puts "           "


Game.new.play

binding.pry