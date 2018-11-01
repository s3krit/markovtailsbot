require_relative 'cocktails'
require 'cinch'

cock = Cocktails.new

bot = Cinch::Bot.new do
  configure do |c|
    c.nick = 'va11halla_'
    c.server = 'irc.rizon.net'
    c.port = '6697'
    c.ssl.use = true
    c.channels = ['#somecoolchannel']
  end

  on :message, '@cocktail' do |m|
    cocktail = cock.generate
    m.reply cocktail[0]
    m.reply cocktail[1]
    m.reply cocktail[2]
  end

  on :message, '.bots' do |m|
    m.reply 'Reporting in! [Ruby] Type @cocktail | github.com/s3krit/markovtailsbot'
  end
end

bot.start
