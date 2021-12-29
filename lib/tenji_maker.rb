require_relative './tenji_maker/base'
require_relative './tenji_maker/upper'
require_relative './tenji_maker/middle'
require_relative './tenji_maker/lower'

class TenjiMaker
  TENJI_POINTS = { all: "oo", left: "o-", right: "-o", none: "--"}.freeze
  private_constant :TENJI_POINTS

  def to_tenji(text)
    upper_points_position  = Upper.new(text).position
    middle_points_position = Middle.new(text).position
    lower_points_position  = Lower.new(text).position

    [
      tenji_format(upper_points_position),
      tenji_format(middle_points_position),
      tenji_format(lower_points_position),
    ].join("\n")
  end

  private

  def tenji_format(points_position)
    points_position.map do |position|
      TENJI_POINTS[position]
    end.join(" ")
  end
end
