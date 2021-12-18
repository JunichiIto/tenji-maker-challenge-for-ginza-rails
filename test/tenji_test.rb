# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/tenji'

class TenjiTest < Minitest::Test
  def setup
    @tenji = Tenji.new
  end

  def test_tenji
    assert_equal [[0, 0], [0, 0], [0, 0]], @tenji.masu
  end

  def test_on_single
    @tenji.on(1)
    assert_equal [[1, 0], [0, 0], [0, 0]], @tenji.masu
  end

  def test_on_all
    @tenji.on(1)
    @tenji.on(2)
    @tenji.on(3)
    @tenji.on(4)
    @tenji.on(5)
    @tenji.on(6)
    assert_equal [[1, 1], [1, 1], [1, 1]], @tenji.masu
  end

  def test_merge
    tenji_a = Tenji.new
    tenji_b = Tenji.new
    tenji_a.on(1)
    tenji_a.on(3)
    tenji_b.on(1)
    tenji_b.on(4)
    tenji = tenji_a + tenji_b
    assert_equal [[1, 1], [0, 0], [1, 0]], tenji.masu
  end
end
