class TenjiMaker
  TENJI_POINTS = { all: "oo", left: "o-", right: "-o", none: "--"}.freeze
  private_constant :TENJI_POINTS

  def to_tenji(text)
    upper_points_position  = upper(text)
    middle_points_position = middle(text)
    lower_points_position  = lower(text)

    [
      tenji_format(upper_points_position),
      tenji_format(middle_points_position),
      tenji_format(lower_points_position),
    ].join("\n")
  end

  private

  def upper(text)
    text.split(" ").map do |char|
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

  def middle(text)
    text.split(" ").map do |char|
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

  def lower(text)
    text.split(" ").map do |char|
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

  def tenji_format(points_position)
    points_position.map do |position|
      TENJI_POINTS[position]
    end.join(" ")
  end
end
