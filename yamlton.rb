#! /usr/bin/ruby

# List all possible Hamiltons
#
require 'yaml'

INPUT_PATH = ARGV[0] || './input.yaml'
NUM_RESULTS = ARGV[1] ? ARGV[1].to_i : 1
INPUT = YAML.load_file(INPUT_PATH)['Yamilton']

GENRES = INPUT['genres']
HISTORICAL_PLOTS = INPUT['historical_plots']
GIMMICKS = INPUT['gimmicks']

VOWELS = %w[a e i o u]
def article(noun)
  first_letter = noun[0].downcase
  if VOWELS.include?(first_letter)
    "An #{noun}"
  else
    "A #{noun}"
  end
end

NUM_RESULTS.times do
  genre = GENRES.sample
  plot = HISTORICAL_PLOTS.sample
  gimmick = GIMMICKS.sample
  puts "#{article(genre)} " +
           "about #{plot}, but #{gimmick}.\n\n"
end
