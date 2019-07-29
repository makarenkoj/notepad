#Encoding:UTF-8

if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require_relative 'lib/post'
require_relative 'lib/memo'
require_relative 'lib/link'
require_relative 'lib/task'


puts 'Привет, я твой блокнот!'
puts
puts 'Что хотите записать в блокнот?'

choices = Post.post_types

choice = -1

until choice >= 0 && choice < choices.size
  choices.each_with_index do |type, index|
    puts "\t#{index}. #{type}"
  end

  choice = gets.to_i
end

entry = Post.create(choice)

entry.read_from_console

entry.save

puts 'Ваша запись сохранена!'
