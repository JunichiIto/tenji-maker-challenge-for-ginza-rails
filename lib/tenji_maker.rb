require_relative './tenji_maker/base'
require_relative './tenji_maker/upper'
require_relative './tenji_maker/middle'
require_relative './tenji_maker/lower'

class TenjiMaker
  TENJI_POINTS = { all: "oo", left: "o-", right: "-o", none: "--"}.freeze
  private_constant :TENJI_POINTS

  def to_tenji(text)
    tenji_build(Upper.new(text), Middle.new(text), Lower.new(text))
  end

  private

  def tenji_build(*rows)
    rows.map do |row|
      tenji_format(row.position)
    end.join("\n")
  end

  def tenji_format(points_position)
    points_position.map do |position|
      TENJI_POINTS[position]
    end.join(" ")
  end
end
