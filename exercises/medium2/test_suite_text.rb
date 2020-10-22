require 'minitest/autorun'
require 'pry'

require_relative 'text'

class TextTest < Minitest::Test
  def setup
    @sample_text = File.open("sample.txt") # => file object
    @text = Text.new(@sample_text.read)
  end

  def teardown
    @sample_text.close
    puts "File has been closed: #{@sample_text.closed?}"
  end

  def test_swap
    swapped_text = File.read("sample.txt").gsub('a', 'e')
    assert_equal(swapped_text, @text.swap('a', 'e'))
  end

  def test_word_count
    assert_equal(File.read("sample.txt").split.count, @text.word_count)
  end
end