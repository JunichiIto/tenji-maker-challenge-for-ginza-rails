require 'tenji_maker/text_to_romaji'
require 'tenji_maker/romaji_to_tenji'
require 'tenji_maker/tenji_to_text'

class TenjiMaker
  include TextToRomaji
  include RomajiToTenji
  include TenjiToText

  def to_tenji(text)
    romaji = text_to_romaji(text)
    tenji  = romaji_to_tenji(romaji)

    tenji_to_text(tenji)
  end
end
