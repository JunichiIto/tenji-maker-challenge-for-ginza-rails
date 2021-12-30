class TenjiNumbersToString
	TENJI_NUMBER_OF_ROWS = 3.freeze

	def exec(tenji_numbers_list)
		tmp = tenji_numbers_list.map do |tn| 
			numbers_to_tenji_array(tn)
		end
		to_str(tmp)
	end

	private

  def numbers_to_tenji_array(numbers)
    (1..6).map do |i|
      numbers.include?(i) ? 'o' : '-'
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
end