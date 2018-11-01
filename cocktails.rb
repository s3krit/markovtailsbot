require_relative 'markov.rb'

# maek cocktails
class Cocktails
  def initialize
    @titles = Markov.new(File.read('titles.txt').tr("\n", ' '))
    @ingredients = Markov.new(File.read('ingredients.txt').tr("\n", ' '))
    @instructions = Markov.new(File.read('instructions.txt').tr("\n", ' '))
  end

  def generate
    title = @titles.get(Random.rand(2..6))
    ingredient = @ingredients.get(Random.rand(5..30))
    instruction = @instructions.get(Random.rand(50)).split('.')[0] + '.'
    resp = [
      'Title: ' + title,
      'Ingredients: ' + ingredient,
      'Instructions: ' + instruction
    ]
    resp
  end
end
