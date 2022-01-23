# frozen_string_literal: true

class Tenji
  DAN = {
    'A' => 0b100000,
    'I' => 0b101000,
    'U' => 0b110000,
    'E' => 0b111000,
    'O' => 0b011000,
  }

  GYO = {
    'K' => 0b000001,
    'S' => 0b000101,
    'T' => 0b000110,
    'N' => 0b000010,
    'H' => 0b000011,
    'M' => 0b000111,
    'Y' => 0b010000,
    'R' => 0b000100,
  }

  HATSUON = 0b000111
  CHO_ON = 0b001100
  SOKUON = 0b001000

  DAKUON = 0b000100
  DAKUON_TABLE = {
    'G' => 'K',
    'Z' => 'S',
    'D' => 'T',
    'B' => 'H',
  }

  HANDAKUON = 0b000001
  HANDAKUON_TABLE = {
    'P' => 'H',
  }

  YO_ON = 0b010000
  YODAKUON = YO_ON | DAKUON
  YOHANDAKUON = YO_ON | HANDAKUON

  def initialize(romaji)
    @romaji = romaji
  end

  def chars
    bytes.map { |byte| render(byte) }
  end

  def bytes
    convert(*@romaji.chars)
  end

  private

  def convert(*chars)
    case chars
    # 促音
    in [gyo, ^gyo, *rest]
      body = convert(gyo, *rest)
      [SOKUON, *body]

    # 濁音、半濁音、拗音、拗濁音、拗半濁音
    in ['G' | 'Z' | 'D' | 'B' => dakuon, dan]
      body = convert(DAKUON_TABLE[dakuon], dan)
      [DAKUON, *body]
    in ['P' => handakuon, dan]
      body = convert(HANDAKUON_TABLE[handakuon], dan)
      [HANDAKUON, *body]
    in ['K' | 'S' | 'T' | 'N' | 'H' | 'M' | 'R' => gyo, 'Y', dan]
      body = convert(gyo, dan)
      [YO_ON, *body]
    in ['G' | 'Z' | 'D' | 'B' => dakuon, 'Y', dan]
      body = convert(DAKUON_TABLE[dakuon], dan)
      [YODAKUON, *body]
    in ['P' => yohandakuon, 'Y', dan]
      body = convert(HANDAKUON_TABLE[yohandakuon], dan)
      [YOHANDAKUON, *body]

    # 清音、その他
    in ['Y' => gyo, 'A' | 'U' => dan]
      [GYO[gyo] | (DAN[dan] >> 4)]
    in ['Y' => gyo, 'O' => dan]
      [GYO[gyo] | (DAN[dan] >> 2)]
    in ['W', 'A' => dan]
      [DAN[dan] >> 4]
    in ['W', 'O' => dan]
      [DAN[dan] >> 2]
    in [gyo, dan]
      [GYO[gyo] | DAN[dan]]
    in ['N']
      [HATSUON]
    in ['-']
      [CHO_ON]
    in [dan]
      [DAN[dan]]
    end
  end

  def render(byte)
    sprintf('%06b', byte)
      .tr('01', '-o')
      .scan(/../)
      .join("\n")
  end
end
