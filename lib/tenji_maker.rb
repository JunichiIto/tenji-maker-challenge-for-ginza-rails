require_relative 'tenji'

class TenjiMaker
  def to_tenji(text)
    tenji_list = text.split(' ').map { |romaji| Tenji.new(romaji) }
    join(tenji_list)
  end

  private

  def join(tenji_list)
    tenji_list
      .map { |tenji| tenji.to_s.split("\n") }
      .transpose
      .map { |row| row.join(' ') }
      .join("\n")
  end
end
