ADJECTIVES = %w[quick lazy sleepy ugly]
NOUNS = %w[fox dog head leg]
VERBS = %w[jumps lifts bites licks]
ADVERBS = %w[easily lazily noisily excitedly]

# Process the file one line at a time
File.foreach('madlib_text.txt') do |line|
  puts format(line, noun:       NOUNS.sample,
                    verb:       VERBS.sample,
                    adjective:  ADJECTIVES.sample,
                    adverb:     ADVERBS.sample)
end