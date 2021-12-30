require_relative './romaji_to_numbers'
require_relative './tenji_numbers_to_string'

class TenjiMaker
  def to_tenji(text)
    tenji_numbers_list = text.split(' ').map do |char|
      tenji_numbers = romaji_to_numbers.exec(char) # 'KA' => [1, 6]
    end
    tenji_numbers_to_string.exec(tenji_numbers_list)
  end

  def romaji_to_numbers
    @romaji_to_numbers ||= RomajiToNumbers.new
  end

  def tenji_numbers_to_string
    @tenji_numbers_to_string ||= TenjiNumbersToString.new
  end
end
