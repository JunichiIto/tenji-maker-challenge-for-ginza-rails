class TenjiMaker
  class Upper < Base
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
