class TenjiMaker
  class Middle
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
        elsif all?(char)
          :all
        end
      end
    end

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

    def all?(char)
      %w[SI SE SO TI TE TO MI ME MO RI RE RO].include?(char)
    end
  end
end
