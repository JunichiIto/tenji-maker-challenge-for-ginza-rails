# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../../lib/tenji_builder/consonant'

class ConsonantTest < Minitest::Test
  def setup
    @consonant = TenjiBuilder::Consonant.new
  end

  def test_k
    tenji_k = @consonant.k
    assert_equal [[0, 0], [0, 0], [0, 1]], tenji_k.masu
  end

  def test_s
    tenji_s = @consonant.s
    assert_equal [[0, 0], [0, 1], [0, 1]], tenji_s.masu
  end

  def test_t
    tenji_t = @consonant.t
    assert_equal [[0, 0], [0, 1], [1, 0]], tenji_t.masu
  end

  def test_n
    tenji_n = @consonant.n
    assert_equal [[0, 0], [0, 0], [1, 0]], tenji_n.masu
  end

  def test_h
    tenji_h = @consonant.h
    assert_equal [[0, 0], [0, 0], [1, 1]], tenji_h.masu
  end

  def test_m
    tenji_m = @consonant.m
    assert_equal [[0, 0], [0, 1], [1, 1]], tenji_m.masu
  end

  def test_r
    tenji_r = @consonant.r
    assert_equal [[0, 0], [0, 1], [0, 0]], tenji_r.masu
  end

  def test_y
    tenji_y = @consonant.y
    assert_equal [[0, 1], [0, 0], [0, 0]], tenji_y.masu
  end

  def test_w
    tenji_w = @consonant.w
    assert_equal [[0, 0], [0, 0], [0, 0]], tenji_w.masu
  end

  def test_nn
    tenji_nn = @consonant.nn
    assert_equal [[0, 0], [0, 1], [1, 1]], tenji_nn.masu
  end
end
