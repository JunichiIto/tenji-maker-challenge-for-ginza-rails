require_relative './romaji_to_numbers'
require_relative './tenji_numbers_to_string'

class TenjiMaker
  def to_tenji(text)
    numbers = tenji_numbers_list(text)
    TenjiNumbersToString.exec(numbers)
  end

  private

  def tenji_numbers_list(text)
    text.split(' ').map do |char|
      RomajiToNumbers.exec(char) # 'KA' => [1, 6]
    end
  end
end
