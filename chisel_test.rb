gem 'minitest', '~> 5.0'    # => true
require 'minitest/autorun'  # => true
require 'minitest/pride'    # => true
require_relative './chisel.rb'   # => true
require_relative 'highlights'

class ChiselTest < Minitest::Test
  def test_h1
    h1 = Chisel.new("# word")
    result = h1.parse
    assert_equal("<h1>word</h1>", result)
  end

  def test_h2
    h2 = Chisel.new("## word")
    result = h2.parse
    assert_equal("<h2>word</h2>", result)
  end

  def test_h3
    h3 = Chisel.new("### word")
    result = h3.parse
    assert_equal("<h3>word</h3>", result)
  end

  def test_h4
    h4 = Chisel.new("#### word")
    result = h4.parse
    assert_equal("<h4>word</h4>", result)
  end

  def test_h5
    h5 = Chisel.new("##### word")
    result = h5.parse
    assert_equal("<h5>word</h5>", result)
  end

  def test_h6
    h6 = Chisel.new("###### word")
    result = h6.parse
    assert_equal("<h6>word</h6>", result)
  end

  def test_h1_no_space
    h1 = Chisel.new("#word")
    result = h1.parse
    assert_equal("<h1>word</h1>", result)
  end

  def test_paragraph
    p1 = Chisel.new("words")
    result = p1.parse
    assert_equal("<p>words</p>", result)
  end

  # def test_parse_bold
  #   chisel = Chisel.new("**words**")
  #   result = chisel.parse_bold
  #   assert_equal("<strong>words</strong>", result)
  # end
  # def test_parse_italics
  #   chisel = Chisel.new("*words*")
  #   result = chisel.parse_italics
  #   assert_equal("<em>words</em>", result)
  # end
end
