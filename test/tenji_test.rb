# frozen_string_literal: true

require 'minitest/autorun'
require_relative '../lib/tenji'

class TenjiTest < Minitest::Test
  def assert_bytes(expected, romaji)
    tenji = Tenji.new(romaji)
    assert_equal expected, tenji.bytes
  end

  def test_bytes
    assert_bytes [0b100000], 'A'
    assert_bytes [0b101000], 'I'
    assert_bytes [0b110000], 'U'
    assert_bytes [0b111000], 'E'
    assert_bytes [0b011000], 'O'

    assert_bytes [0b100001], 'KA'
    assert_bytes [0b101001], 'KI'
    assert_bytes [0b110001], 'KU'
    assert_bytes [0b111001], 'KE'
    assert_bytes [0b011001], 'KO'

    assert_bytes [0b100101], 'SA'
    assert_bytes [0b100110], 'TA'
    assert_bytes [0b100010], 'NA'
    assert_bytes [0b100011], 'HA'
    assert_bytes [0b100111], 'MA'
    assert_bytes [0b100100], 'RA'

    assert_bytes [0b010010], 'YA'
    assert_bytes [0b010011], 'YU'
    assert_bytes [0b010110], 'YO'
    assert_bytes [0b000010], 'WA'
    assert_bytes [0b000110], 'WO'
    assert_bytes [0b000111], 'N'

    assert_bytes [0b001100], '-'

    assert_bytes [0b000100, 0b100001], 'GA'
    assert_bytes [0b000100, 0b101101], 'ZI'
    assert_bytes [0b000100, 0b110110], 'DU'
    assert_bytes [0b000100, 0b111011], 'BE'

    assert_bytes [0b000001, 0b011011], 'PO'

    assert_bytes [0b010000, 0b100001], 'KYA'
    assert_bytes [0b010000, 0b100101], 'SYA'
    assert_bytes [0b010000, 0b110110], 'TYU'
    assert_bytes [0b010000, 0b110010], 'NYU'
    assert_bytes [0b010000, 0b011011], 'HYO'
    assert_bytes [0b010000, 0b011111], 'MYO'
    assert_bytes [0b010000, 0b011100], 'RYO'

    assert_bytes [0b010100, 0b100001], 'GYA'
    assert_bytes [0b010100, 0b100101], 'ZYA'
    assert_bytes [0b010100, 0b110110], 'DYU'
    assert_bytes [0b010100, 0b011011], 'BYO'

    assert_bytes [0b010001, 0b100011], 'PYA'

    assert_bytes [0b001000, 0b011001], 'KKO'
  end

  def assert_chars(expected, romaji)
    tenji = Tenji.new(romaji)
    assert_equal expected, tenji.chars
  end

  def test_chars
    assert_chars [<<~TENJI.chomp], 'A'
      o-
      --
      --
    TENJI

    assert_chars [<<~TENJI.chomp], 'I'
      o-
      o-
      --
    TENJI

    assert_chars [<<~TENJI.chomp], 'U'
      oo
      --
      --
    TENJI

    assert_chars [<<~TENJI.chomp], 'E'
      oo
      o-
      --
    TENJI

    assert_chars [<<~TENJI.chomp], 'O'
      -o
      o-
      --
    TENJI

    assert_chars [<<~TENJI.chomp], 'KA'
      o-
      --
      -o
    TENJI

    assert_chars [<<~TENJI_1.chomp, <<~TENJI_2.chomp], 'GA'
      --
      -o
      --
    TENJI_1
      o-
      --
      -o
    TENJI_2
  end
end
