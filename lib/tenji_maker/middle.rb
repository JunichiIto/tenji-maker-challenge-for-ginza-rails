class TenjiMaker
  class Middle
    attr_reader :text

    def initialize(text)
      @text = text.split(" ")
    end

    def position
      text.map do |char|
        next :right if char == "N"

        if %w[A U KA KU NA NU HA HU YA YU WA].include?(char)
          :none
        elsif %w[SA SU TA TU MA MU RA RU YO WO].include?(char)
          :right
        elsif %w[I E O KI KE KO NI NE NO HI HE HO].include?(char)
          :left
        elsif %w[SI SE SO TI TE TO MI ME MO RI RE RO].include?(char)
          :all
        end
      end
    end
  end
end
