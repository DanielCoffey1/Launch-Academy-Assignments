def greet(name, language = nil)
  if language == 'spanish'
    puts "Hola #{name}!"
  elsif language == 'italian'
    puts "Ciao #{name}!"
  elsif language == 'french'
    puts "Bonjour #{name}!"
  else
    puts "Hi #{name}!"
  end
end
