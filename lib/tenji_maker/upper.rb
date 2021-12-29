class TenjiMaker
  class Upper
    attr_reader :text

    def initialize(text)
      @text = text.split(" ")
    end

    def position
      text.map do |char|
        next :none if char == "N"

        if char.start_with?("W")
          :none
        elsif char.start_with?("Y") || char.end_with?("O")
          :right
        elsif char.end_with?("A", "I")
          :left
        elsif char.end_with?("U", "E")
          :all
        end
      end
    end
  end
end
