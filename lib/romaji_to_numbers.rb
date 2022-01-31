class RomajiToNumbers
  CONSONANT_TO_NUMBERS = {
    'K' => [6].freeze,
    'S' => [5, 6].freeze,
    'T' => [3, 5].freeze,
    'N' => [3].freeze,
    'H' => [3, 6].freeze,
    'M' => [3, 5, 6].freeze,
    'Y' => [4].freeze,
    'R' => [5].freeze,
    'W' => [].freeze,
    ''  => [].freeze,
  }.freeze

  VOWEL_TO_NUMBERS = {
    'A' => [1].freeze,
    'I' => [1, 2].freeze,
    'U' => [1, 4].freeze,
    'E' => [1, 2, 4].freeze,
    'O' => [2, 4].freeze,
    'N' => [3, 5, 6].freeze,
  }.freeze

  VOWEL_TO_NUMBERS_DOWN = {
    'A' => [3].freeze,
    'I' => [2, 3].freeze,
    'U' => [3, 6].freeze,
    'E' => [2, 3, 5].freeze,
    'O' => [3, 5].freeze,
  }.freeze

  def exec(char)
    consonant_vowel = separate_c_and_v(char) # 'KA' => ['K', 'A']
    romaji_to_numbers(consonant_vowel) # ['K', 'A'] => [1, 6]
  end

  private

  def separate_c_and_v(romaji)
    ['A', 'I', 'U', 'E', 'O'].each do |v|
      if (i = romaji.index(v))
        return [romaji[0...i], romaji[i]] # 母音の直前までが子音のはずだ
      end
    end
    ['', romaji] # あ行, ん
  end

  def romaji_to_numbers(consonant_vowel)
    c = consonant_vowel[0]
    v = consonant_vowel[1]
    if (c == 'Y' || c == 'W')
      numbers = CONSONANT_TO_NUMBERS[c] | VOWEL_TO_NUMBERS_DOWN[v]
    else
      numbers = CONSONANT_TO_NUMBERS[c] | VOWEL_TO_NUMBERS[v]
    end
  end
end
