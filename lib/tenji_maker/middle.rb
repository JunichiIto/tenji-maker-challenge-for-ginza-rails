class TenjiMaker
  class Middle < Base
    private

    def for_N
      :right
    end

    def none?(char)
      %w[A U KA KU NA NU HA HU YA YU WA].include?(char)
    end

    def right?(char)
      %w[SA SU TA TU MA MU RA RU YO WO].include?(char)
    end

    def left?(char)
      %w[I E O KI KE KO NI NE NO HI HE HO].include?(char)
    end
  end
end
