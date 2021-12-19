# frozen_string_literal: true

class TenjiMaker
  # 点字の表示方法。ON が浮き出し。
  TENJI_ON  = 'o'
  TENJI_OFF = '-'

  # 引数の区切り文字
  ARGS_SEP = ' '
  # 各マス結合時に間に挟む文字列
  MASU_SEP = ' '
  private_constant :TENJI_ON, :TENJI_OFF, :ARGS_SEP, :MASU_SEP

  def to_tenji(text)
    chars = text.split(ARGS_SEP)
    tenjis = chars.map { |char| convert(char) }
    masus = concat(tenjis.map(&:masu))
    masus.join("\n")
  end

  # 複数のマスを一つのマスに結合する
  def concat(masus)
    concated_masus = Array.new(Tenji::MASU_ROW_SIZE) { [] }

    masus.each do |masu|
      masu.each_with_index do |line, index|
        concated_masus[index] << line.map { |number| number.positive? ? TENJI_ON : TENJI_OFF }.join
      end
    end

    # 各マスの間は、MASU_SEP で指定された文字列で結合する
    concated_masus.map { |masu| masu.join(MASU_SEP) }
  end

  private

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
