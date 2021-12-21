# frozen_string_literal: true

# nodoc:
class TenjiMaker
  def to_tenji(text)
    text.split(' ')
        .map { |char| to_bits(char) }
        .map { |bits| to_tenji_array(bits) }
        .transpose
        .map { |line| line.join(' ') }
        .join("\n")
    # to_bits:
    #   ローマ文を点字ビットパターンへ変換
    #     [
    #       1文字目のビットパターン,
    #       2文字目のビットパターン,
    #       ...
    #     ]
    # to_tenji_array:
    #   点字ビットパターンを行毎に分割した点字文字列へ変換
    #     [
    #       [ 1文字目1行目, 1文字目2行目, 1文字目3行目 ],
    #       [ 2文字目1行目, 2文字目2行目, 2文字目3行目 ],
    #       ...
    #     ]
    # transpose:
    #   配列を文字毎から行毎へ変換
    #     [
    #       [ 1文字目1行目, 2文字目1行目, ...],
    #       [ 1文字目2行目, 2文字目2行目, ...],
    #       [ 1文字目3行目, 2文字目3行目, ...]
    #     ]
  end

  private

  def to_bits(char)
    # char を(子)(母)に分割
    # (子)(母)の組み合わせからビットパターンを生成
    /^(.)?(.)$/.match(char)
               .captures
               .then { |c1, c2| SIIN[c1][BOIN[c2]] }
  end

  def to_tenji_array(bits)
    format('%06b', bits).tr('01', '-o').scan(/../)
  end

  # http://www.naiiv.net/braille/?tenji-sikumi
  # ビット列は文字の出力順に合わせており、
  # 上記サイトの (1)(4)_(2)(5)_(3)(6) の並びに相当する。
  BOIN = {
    'A' => 0b10_00_00,
    'I' => 0b10_10_00,
    'U' => 0b11_00_00,
    'E' => 0b11_10_00,
    'O' => 0b01_10_00,
    'N' => 0b00_01_11
  }.freeze
  SIIN = {
    nil => ->(b) { b },
    'K' => ->(b) { b | 0b00_00_01 },
    'S' => ->(b) { b | 0b00_01_01 },
    'T' => ->(b) { b | 0b00_01_10 },
    'N' => ->(b) { b | 0b00_00_10 },
    'H' => ->(b) { b | 0b00_00_11 },
    'M' => ->(b) { b | 0b00_01_11 },
    'R' => ->(b) { b | 0b00_01_00 },
    'Y' => ->(b) { shift(b) | 0b01_00_00 },
    'W' => ->(b) { shift(b) | 0b00_00_00 }
  }.freeze

  def self.shift(bits)
    # 0b00_11_00 との & で 2段目のデータ有無を判定し、
    # 2段目があれば 1行(2ビット)だけシフト、
    # 2段目がなければ 2行(4ビット)だけシフトする
    bits >> ((bits & 0b00_11_00).positive? ? 2 : 4)
  end
  private_class_method :shift
end
