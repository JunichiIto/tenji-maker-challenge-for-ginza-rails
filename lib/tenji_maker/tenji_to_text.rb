class TenjiMaker
  module TenjiToText
    private

    # @param tenji [Array<Array<String>>] array of tenji (including dots)
    # @return [String] tenji text into 3 lines
    def tenji_to_text(tenji)
      Array.new(3) do |i|
        tenji.map { |character| character[i] }.join(' ')
      end.join("\n")
    end
  end
end
