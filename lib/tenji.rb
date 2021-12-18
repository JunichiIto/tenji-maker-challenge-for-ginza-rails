# frozen_string_literal: true

class Tenji
  # 点字は、縦３点、横２点の６点の組み合わせで作られておりこの単位をマスという
  # マスには以下の番号が割り当てられている
  #
  # 1 4
  # 2 5
  # 3 6
  #
  # http://www.naiiv.net/braille/?tenji-sikumi

  # 値は[行、列]で設定する
  INDEX_TABLE = {
    1 => [0, 0],
    2 => [1, 0],
    3 => [2, 0],
    4 => [0, 1],
    5 => [1, 1],
    6 => [2, 1]
  }.freeze

  attr_reader :masu

  def initialize
    # 初期状態では全て点なし
    @masu = [[0, 0], [0, 0], [0, 0]]
  end

  # 指定された番号を点(1)とする
  def on(number)
    row, col = INDEX_TABLE[number]
    masu[row][col] = 1
  end

  def +(other)
    other_masu = other.masu

    masu.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        next if col.positive?

        masu[row_index][col_index] = col + other_masu[row_index][col_index]
      end
    end

    self
  end

  def reverse!
    masu.reverse!
    self
  end
end
