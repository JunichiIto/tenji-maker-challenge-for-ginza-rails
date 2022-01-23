# frozen_string_literal: true

require_relative 'tenji'

class TenjiMaker
  def to_tenji(text)
    tenji_list = text.split(' ').map { |romaji| Tenji.new(romaji) }
    join(tenji_list)
  end

  private

  def join(tenji_list)
    tenji_list
      .flat_map(&:chars)
      .map { |tenji| tenji.split("\n") }
      .transpose
      .map { |row| row.join(' ') }
      .join("\n")
  end
end
