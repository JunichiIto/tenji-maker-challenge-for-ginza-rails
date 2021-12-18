# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/tenji_builder/vowel'

class VowelTest < Minitest::Test
  def setup
    @vowel = TenjiBuilder::Vowel.new
  end

  def test_a
    tenji_a = @vowel.a
    assert_equal [[1, 0], [0, 0], [0, 0]], tenji_a.masu
  end

  def test_i
    tenji_i = @vowel.i
    assert_equal [[1, 0], [1, 0], [0, 0]], tenji_i.masu
  end

  def test_u
    tenji_u = @vowel.u
    assert_equal [[1, 1], [0, 0], [0, 0]], tenji_u.masu
  end

  def test_e
    tenji_e = @vowel.e
    assert_equal [[1, 1], [1, 0], [0, 0]], tenji_e.masu
  end

  def test_o
    tenji_o = @vowel.o
    assert_equal [[0, 1], [1, 0], [0, 0]], tenji_o.masu
  end
end
