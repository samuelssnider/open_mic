require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/user'
require './lib/joke'

class UserTest < Minitest::Test
  def test_it_exists
    sal = User.new("Sal")

    assert_instance_of User, sal
  end

  def test_it_has_a_name
    sal = User.new("Sal")

    assert_equal "Sal", sal.name
  end

  def test_it_can_have_another_name
    ali = User.new("Ali")

    assert_equal "Ali", ali.name
  end

  def test_jokes
    sal = User.new("Sal")
    assert sal.jokes.empty?
    sal.learn(Joke.new({id: 1, question: "Why did the strawberry cross the road", answer: "Because his mother was in a jam"}))
    assert_equal 1, sal.jokes.count
  end

  def test_jokes_can_be_transfered
    sal = User.new("Sal")
    j = Joke.new({id: 1, question: "Why did the strawberry cross the road", answer: "Because his mother was in a jam"})
    sal.learn(j)
    assert_equal 1, sal.jokes.count
    ali = User.new("Ali")
    sal.tell(ali, j)
    refute ali.jokes.empty?
    assert_equal 1, ali.jokes.count
  end


  def test_preform_routine
    joke_1 = Joke.new({id: 1, question: "Why did the strawberry cross the road?", answer: "Because his mother was in a jam."})
    joke_2 = Joke.new({id: 2, question: "How do you keep a lion from charging?", answer: "Take away its credit cards."})
    ilana = User.new("Ilana")
    josh = User.new("Josh")
    ilana.learn(joke_1)
    ilana.learn(joke_2)
    ilana.preform_routine_for(josh)
    assert_equal 2, josh.jokes.count
  end

  def test_learning_routine
    josh = User.new("Josh")
    josh.learn_routine('./jokes.csv')
    assert_equal 100, josh.jokes.count
  end


end
