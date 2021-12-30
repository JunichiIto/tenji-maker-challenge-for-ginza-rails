# frozen_string_literal: true

class TenjiMaker
  REGULAR_ARRANGEMENTS = {
    A: '1', I: '12', U: '14', E: '124', O: '24',
    K: '6', S: '56', T: '35', N: '3', H: '36', M: '356', R: '5'
  }.transform_keys(&:to_s).freeze

  IRREGULAR_ARRANGEMENTS = {
    YA: '34', YU: '346', YO: '345', WA: '3', N: '356'
  }.transform_keys(&:to_s).freeze

  def to_tenji(text)
    romanizations = text.split("\s")

    rows =
      romanizations.map do |romanization|
        arrangement = to_arrangement(romanization)
        dots = create_dots(arrangement)
        dots.each_slice(3).to_a.transpose.map(&:join)
      end
    rows.transpose.map { _1.join("\s") }.join("\n")
  end

  def to_arrangement(romanization)
    if (arrangement = IRREGULAR_ARRANGEMENTS[romanization])
      arrangement
    else
      arrangements = romanization.each_char.map { REGULAR_ARRANGEMENTS[_1] }
      arrangements.join.squeeze
    end
  end

  def create_dots(arrangement)
    (1..6).map do |number|
      arrangement.include?(number.to_s) ? 'o' : '-'
    end
  end
end
