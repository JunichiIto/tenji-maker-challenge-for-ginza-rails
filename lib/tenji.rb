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

  def initialize(romaji)
    @romaji = romaji
  end

  def to_i
    case @romaji.chars
    in ['Y' => gyo, 'A' | 'U' => dan] then GYO[gyo] | (DAN[dan] >> 4)
    in ['Y' => gyo, 'O' => dan]       then GYO[gyo] | (DAN[dan] >> 2)
    in ['W', 'A' => dan]              then DAN[dan] >> 4
    in [gyo, dan]                     then GYO[gyo] | DAN[dan]
    in ['N']                          then 0b000111
    in [dan]                          then DAN[dan]
    end
  end

  def to_s
    sprintf('%06b', to_i).tr('01', '-o').scan(/../).join("\n")
  end
end
