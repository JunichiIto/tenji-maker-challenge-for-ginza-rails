class TenjiNumbersToString
  TENJI_NUMBER_OF_ROWS = 3.freeze

  class << self
    def exec(tenji_numbers_list)
      build_tenji(tenji_numbers_list)
    end

    private

    def build_tenji(tenji_numbers_list)
      tenji_array_list = tenji_numbers_list.map{|tn| numbers_to_tenji_array(tn) }
      tmp = Array.new(TENJI_NUMBER_OF_ROWS){ Array.new }
      TENJI_NUMBER_OF_ROWS.times do |i|
        tenji_array_list.each do |arr|
          tmp[i].push "#{arr[0+i]}#{arr[3+i]}"
          tmp[i].push ' '
        end
        tmp[i].pop
      end
      "#{tmp[0].join}\n#{tmp[1].join}\n#{tmp[2].join}"
    end

    def numbers_to_tenji_array(numbers)
      (1..6).map do |i|
        numbers.include?(i) ? 'o' : '-'
      end
    end
  end
end
