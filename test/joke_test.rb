require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/joke'

class JokeTest < Minitest::Test

  def test_it_exists
    j = Joke.new({id: 1, question: "Why did the strawberry cross the road", answer: "Because his mother was in a jam"})
    assert j
    assert_instance_of Joke, j
  end

  def test_its_chars_can_be_got
    j = Joke.new({id: 1, question: "Why did the strawberry cross the road", answer: "Because his mother was in a jam"})
    assert_equal 1,  j.id
    assert_equal "Why did the strawberry cross the road", j.question
    assert_equal "Because his mother was in a jam", j.answer
  end

end
