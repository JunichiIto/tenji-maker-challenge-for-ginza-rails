class TenjiMaker
  class Lower
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
      :all
    end

    def none?(char)
      char.start_with?("R") || char.length == 1
    end

    def right?(char)
      char.start_with?("K", "S")
    end

    def left?(char)
      char.start_with?("T", "N", "W", "Y") && char != "YU"
    end
  end
end
