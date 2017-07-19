require './lib/joke'

class User
  attr_reader :name,
              :jokes

  def initialize(name)
    @name = name
    @jokes = []
  end

  def learn(joke)
    @jokes << joke
  end

  def tell(person, joke)
    person.learn(joke)
  end

  def preform_routine_for(person)
    @jokes.each do |joke|
      self.tell(person, joke)
    end
  end

  def learn_routine(filename)
    file = File.open(filename)
    txt = file.read()
    file.close
    all_joke = txt.split("\n")
    all_joke.each do |joke|
      joke_ary = joke.split(",")
      j = Joke.new({id: joke_ary[0], question: joke_ary[1], answer: joke_ary[2]})
      self.learn(j)
    end
  end
end
