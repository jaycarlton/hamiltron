#! /usr/bin/ruby

# List all possible Hamiltons
#
require 'yaml'

INPUT_PATH = ARGV[0] || './input.yaml'
NUM_RESULTS = ARGV[1].to_i || 1
INPUT = YAML.load_file(INPUT_PATH)['Yamilton']

GENRES = INPUT['genres']
HISTORICAL_PLOTS = INPUT['historical_plots']
GIMMICKS = INPUT['gimmicks']

p "#{GENRES.length * HISTORICAL_PLOTS.length * GIMMICKS.length} possible plays.\n\n"

VOWELS = %w[a e i o u]
def article(type, noun)
  first_letter = noun[0]
  if VOWELS.include?(first_letter)
    "an #{noun}"
  else
    "a #{noun}"
  end
end

NUM_RESULTS.times do
  genre = GENRES.sample
  plot = HISTORICAL_PLOTS.sample
  gimmick = GIMMICKS.sample
  puts "#{article(:indefinite, genre).upcase}  " +
           "about #{plot.upcase}, but #{gimmick.upcase}\n\n"
end
