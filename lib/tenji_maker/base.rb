class TenjiMaker
  class Base
    private attr_reader :text

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
  end
end
