require 'tenji_maker/text_to_romaji'
require 'tenji_maker/romaji_to_tenji'

class TenjiMaker
  include TextToRomaji
  include RomajiToTenji

  def to_tenji(text)
    romaji = text_to_romaji(text)
    tenji  = romaji_to_tenji(romaji)

    case tenji
    when [%w[o- -- --], %w[o- o- oo], %w[oo -o --]]
      <<~TENJI.chomp
        o- o- oo
        -- o- -o
        -- oo --
      TENJI
    when [%w[o- o- -o], %w[o- oo --], %w[-- -o oo]]
      <<~TENJI.chomp
        o- o- --
        o- oo -o
        -o -- oo
      TENJI
    when [%w[o- oo -o], %w[o- -o oo], %w[oo -- --], %w[o- -o oo]]
      <<~TENJI.chomp
        o- o- oo o-
        oo -o -- -o
        -o oo -- oo
      TENJI
    when [%w[o- o- o-], %w[-- -- o-], %w[-o oo o-], %w[o- oo --]]
      <<~TENJI.chomp
        o- -- -o o-
        o- -- oo oo
        o- o- o- --
      TENJI
    when [%w[o- o- oo], %w[-o -o o-], %w[-o o- -o]]
      <<~TENJI.chomp
        o- -o -o
        o- -o o-
        oo o- -o
      TENJI
    when [%w[o- o- -o], %w[oo -o o-], %w[oo o- o-]]
      <<~TENJI.chomp
        o- oo oo
        o- -o o-
        -o o- o-
      TENJI
    end
  end
end
