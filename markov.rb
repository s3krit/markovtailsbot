# Markov class
class Markov
  def initialize(text)
    # {Word: {word: 1, word2: 2}}
    @wordhash = {}
    words = text.split(' ')
    words.each_with_index do |word, i|
      @wordhash[word] ||= {}
      # Each time go over a word, increase its successor count by 1
      if @wordhash[word][words[i + 1]]
        @wordhash[word][words[i + 1]] += 1
      else
        @wordhash[word][words[i + 1]] = 1
      end
    end
  end

  def get(words = 2)
    string = ''
    word = @wordhash.keys.sample
    return '' unless word
    words.times do
      string += word + ' '
      word = get_next(word)
    end
    string.strip
  end

  def get_next(word)
    return unless @wordhash[word]
    words = []
    @wordhash[word].each do |next_word, times|
      next if next_word.nil?
      words.push(((next_word + ' ') * times).split)
    end
    words.flatten.sample
  end
end
