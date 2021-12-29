class TenjiMaker
  class Lower < Base
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
