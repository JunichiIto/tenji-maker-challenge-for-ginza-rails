class TenjiMaker
  class Lower
    attr_reader :text

    def initialize(text)
      @text = text.split(" ")
    end

    def position
      text.map do |char|
        next :all if char == "N"

        if char.start_with?("R") || char.length == 1
          :none
        elsif char.start_with?("K", "S")
          :right
        elsif char.start_with?("T", "N", "W", "Y") && char != "YU"
          :left
        else
          :all
        end
      end
    end
  end
end
