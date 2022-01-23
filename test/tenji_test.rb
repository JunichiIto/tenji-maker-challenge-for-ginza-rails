require 'minitest/autorun'
require_relative '../lib/tenji'

class TenjiTest < Minitest::Test
  def assert_to_i(expected, romaji)
    tenji = Tenji.new(romaji)
    assert_equal expected, tenji.to_i
  end

  def test_to_i
    assert_to_i 0b100000, 'A'
    assert_to_i 0b101000, 'I'
    assert_to_i 0b110000, 'U'
    assert_to_i 0b111000, 'E'
    assert_to_i 0b011000, 'O'

    assert_to_i 0b100001, 'KA'
    assert_to_i 0b101001, 'KI'
    assert_to_i 0b110001, 'KU'
    assert_to_i 0b111001, 'KE'
    assert_to_i 0b011001, 'KO'

    assert_to_i 0b100101, 'SA'
    assert_to_i 0b100110, 'TA'
    assert_to_i 0b100010, 'NA'
    assert_to_i 0b100011, 'HA'
    assert_to_i 0b100111, 'MA'
    assert_to_i 0b100100, 'RA'

    assert_to_i 0b010010, 'YA'
    assert_to_i 0b010011, 'YU'
    assert_to_i 0b010110, 'YO'
    assert_to_i 0b000010, 'WA'
    assert_to_i 0b000111, 'N'
  end

  def assert_to_s(expected, romaji)
    tenji = Tenji.new(romaji)
    assert_equal expected.chomp, tenji.to_s
  end

  def test_to_s
    assert_to_s <<~TENJI, 'A'
      o-
      --
      --
    TENJI

    assert_to_s <<~TENJI, 'I'
      o-
      o-
      --
    TENJI

    assert_to_s <<~TENJI, 'U'
      oo
      --
      --
    TENJI

    assert_to_s <<~TENJI, 'E'
      oo
      o-
      --
    TENJI

    assert_to_s <<~TENJI, 'O'
      -o
      o-
      --
    TENJI

    assert_to_s <<~TENJI, 'KA'
      o-
      --
      -o
    TENJI
  end
end
