#Draw from Text file defined as argumenent - ARGV[0] special array
lines = File.readlines(ARGV[0])
line_count = lines.size
text = lines.join

# Count the number of lines within the file
puts "#{line_count} lines are contained within the text."
sleep 0.5

#Count the number of characters in the file
total_characters = text.length
puts "#{total_characters} total characters including spacees are contained within the text."
sleep 0.5

#Count the number of non whitespace charcters in the file
total_characters_nospaces = text.gsub(/\s+/, '').length
puts "#{total_characters_nospaces} characters not including spaces are contained within the text."
sleep 0.5

#Count the number of words in the text
word_count = text.split.length
puts  " #{word_count} words in this text."
sleep 0.5
word_count_2 = text.scan(/\w+/).length
puts " #{word_count_2} words in this text using the scan method which splits hyphens."

#Count the number of sentences by counting punctuation marks
sentence_count = text.split(/\.|\?|!/).length
puts " #{sentence_count} sentences in this text using split method."
sentence_count2 = text.scan(/\.|\?|!/).length
sleep 0.5
puts " #{sentence_count2} sentences in this text using scan."

#count the number of paragraphs in a given text
paragraph_count = text.split(/\n\n/).length
puts "#{paragraph_count} paragraphs in the given text."

#Count the average words per sentence mathematically.
puts "#{sentence_count / paragraph_count} average sentences per paragraph."
sleep 0.5

#Count the number of fluff words - note the use of exclamation mark to define NOT
puts "#{word_count / sentence_count} average words per sentence."
stopwords = %w{the a by on for of are with just and but to the my I has some in it be}
words = text.scan(/\w+/)
keywords = words.select { |word| !stopwords.include?(word) }

fluff = ((keywords.length.to_f / words.length.to_f) * 100).to_i
puts "#{fluff} percentage of non fluff words"
text


# Summarise the text by Cherry Picking Choice Sentences.
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select{|sentence| sentence =~ /is|are/ }
puts "Summary:\n\n" + ideal_sentences.join(". ")
puts "End of Analysis"
