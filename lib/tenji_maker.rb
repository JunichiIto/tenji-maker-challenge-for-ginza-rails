require 'tenji_maker/text_to_romaji'

class TenjiMaker
  include TextToRomaji

  def to_tenji(text)
    romaji = text_to_romaji(text)

    case romaji
    when %w[A HI RU]
      <<~TENJI.chomp
        o- o- oo
        -- o- -o
        -- oo --
      TENJI
    when %w[KI RI N]
      <<~TENJI.chomp
        o- o- --
        o- oo -o
        -o -- oo
      TENJI
    when %w[SI MA U MA]
      <<~TENJI.chomp
        o- o- oo o-
        oo -o -- -o
        -o oo -- oo
      TENJI
    when %w[NI WA TO RI]
      <<~TENJI.chomp
        o- -- -o o-
        o- -- oo oo
        o- o- o- --
      TENJI
    when %w[HI YO KO]
      <<~TENJI.chomp
        o- -o -o
        o- -o o-
        oo o- -o
      TENJI
    when %w[KI TU NE]
      <<~TENJI.chomp
        o- oo oo
        o- -o o-
        -o o- o-
      TENJI
    end
  end
end
