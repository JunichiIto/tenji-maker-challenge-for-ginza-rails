# frozen_string_literal: true

class TenjiMaker
  def to_tenji(text)
    # 以下はサンプルの仮実装なので、このcase文は全部消して自作ロジックに書き直すこと
    case text
    when 'A HI RU'
      <<~TENJI.chomp
        o- o- oo
        -- o- -o
        -- oo --
      TENJI
    when 'KI RI N'
      <<~TENJI.chomp
        o- o- --
        o- oo -o
        -o -- oo
      TENJI
    when 'SI MA U MA'
      <<~TENJI.chomp
        o- o- oo o-
        oo -o -- -o
        -o oo -- oo
      TENJI
    when 'NI WA TO RI'
      <<~TENJI.chomp
        o- -- -o o-
        o- -- oo oo
        o- o- o- --
      TENJI
    when 'HI YO KO'
      <<~TENJI.chomp
        o- -o -o
        o- -o o-
        oo o- -o
      TENJI
    when 'KI TU NE'
      <<~TENJI.chomp
        o- oo oo
        o- -o o-
        -o o- o-
      TENJI
    end
  end

  def convert(char)
    # 子音はnilの場合もあるので、reverse して母音から取得する
    vowel, consonant = char.split(//).reverse

    # vowel が「n」の場合は「ん」を返す
    return TenjiBuilder::Consonant.new.nn if vowel.downcase == 'n'

    # 母音の点字を作成
    tenji_vowel = TenjiBuilder::Vowel.new.__send__(vowel.downcase)
    return tenji_vowel unless consonant

    # 子音+母音の点字を作成
    TenjiBuilder::Consonant.new.__send__(consonant.downcase, tenji_vowel)
  end
end
