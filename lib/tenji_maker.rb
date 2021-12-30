class TenjiMaker
  TENJI_NUMBER_OF_ROWS = 3.freeze

  def to_tenji(text)
    tenji_array_list = text.split(' ').map do |char|
      consonant_vowel = separate_c_and_v(char)
      tenji_numbers = romaji_to_numbers(consonant_vowel)
      numbers_to_tenji_array(tenji_numbers)
    end
    to_str(tenji_array_list)
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

  def numbers_to_tenji_array(numbers)
    ten = ['-', '-', '-', '-', '-', '-']
    numbers.each do |n|
      ten[n-1] = 'o'
    end
    ten
    (1..6).map do |i|
      numbers.include?(i) ? 'o' : '-'
    end
  end

  def romaji_to_numbers(consonant_vowel)
    c = consonant_vowel[0]
    v = consonant_vowel[1]
    if (c == 'Y' || c == 'W')
      numbers = consonant_to_numbers(c) | vowel_to_numbers_down(v)
    else
      numbers = consonant_to_numbers(c) | vowel_to_numbers(v)
    end
  end

  def to_str(tenji_array_list)
    tmp = Array.new(TENJI_NUMBER_OF_ROWS){Array.new}
    TENJI_NUMBER_OF_ROWS.times do |i|
      tenji_array_list.each do |arr|
        tmp[i].push "#{arr[0+i]}#{arr[3+i]}"
        tmp[i].push ' '
      end
      tmp[i].pop
    end
    "#{tmp[0].join}\n#{tmp[1].join}\n#{tmp[2].join}"
  end

  def vowel_to_numbers(v)
    case v
    in 'A' then [1]
    in 'I' then [1,2]
    in 'U' then [1,4]
    in 'E' then [1,2,4]
    in 'O' then [2,4]
    in 'N' then [3,5,6]
    end
  end

  def vowel_to_numbers_down(v)
    case v
    in 'A' then [3]
    in 'I' then [2,3]
    in 'U' then [3,6]
    in 'E' then [2,3,5]
    in 'O' then [3,5]
    end
  end

  def consonant_to_numbers(c)
    case c
    in 'K' then [6]
    in 'S' then [5,6]
    in 'T' then [3,5]
    in 'N' then [3]
    in 'H' then [3,6]
    in 'M' then [3,5,6]
    in 'Y' then [4]
    in 'R' then [5]
    in 'W' then []
    in ''  then []
    end
  end
end
