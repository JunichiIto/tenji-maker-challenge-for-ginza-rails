class TenjiMaker
  class Upper
    attr_reader :text

    def initialize(text)
      @text = text.split(" ")
    end

    def position
      text.map do |char|
        next for_N if char == "N"

        if none?(char)
          :none
        elsif right?(char)
          :right
        elsif left?(char)
          :left
        else
          :all
        end
      end
    end

    private

    def for_N
      :none
    end

    def none?(char)
      char.start_with?("W")
    end

    def right?(char)
      char.start_with?("Y") || char.end_with?("O")
    end

    def left?(char)
      char.end_with?("A", "I")
    end
  end
end
