class TenjiMaker
  class Character
    # メモリ消費量削減のため、何回も出てくる表示用記号を定数にする
    DOT = 'o'.freeze
    NO_DOT = '-'.freeze
    VOWELS = {
      'A' => [DOT, NO_DOT, NO_DOT],
      'I' => [DOT, NO_DOT, DOT],
      'U' => [DOT, DOT, NO_DOT],
      'E' => [DOT, DOT, DOT],
      'O' => [NO_DOT, DOT, DOT],
    }
    CONSONANTS = {
      'K' => [NO_DOT, NO_DOT, DOT],
      'S' => [DOT, NO_DOT, DOT],
      'T' => [DOT, DOT, NO_DOT],
      'N' => [NO_DOT, DOT, NO_DOT],
      'H' => [NO_DOT, DOT, DOT],
      'M' => [DOT, DOT, DOT],
      'R' => [DOT, NO_DOT, NO_DOT],
      :empty => [NO_DOT, NO_DOT, NO_DOT]
    }
    SPECIALS = {
      'YA' => [NO_DOT, DOT, NO_DOT, NO_DOT, DOT, NO_DOT],
      'YU' => [NO_DOT, DOT, NO_DOT, NO_DOT, DOT, DOT],
      'YO' => [NO_DOT, DOT, NO_DOT, DOT, DOT, NO_DOT],
      'WA' => [NO_DOT, NO_DOT, NO_DOT, NO_DOT, DOT, NO_DOT],
      'WO' => [NO_DOT, NO_DOT, NO_DOT, DOT, DOT, NO_DOT],
      'N' =>  [NO_DOT, NO_DOT, NO_DOT, DOT, DOT, DOT]
    }

    attr_reader :text
    def initialize(text)
      @text = text
    end

    def lines
      @lines ||= tenji.each_slice(2).to_a
    end

    private

    def tenji
      SPECIALS.fetch(text) { compose }
    end

    def compose
      consonant, vowel = text.size == 1 ? [:empty, text] : text.chars
      VOWELS[vowel] + CONSONANTS[consonant]
    end
  end

  def to_tenji(text)
    result = ''
    characters = text.split.map { |char| Character.new(char) }
    3.times do |i|
      result << characters.inject('') do |line, character|
        line << character.lines[i].join
        line << ' '
      end.strip # 最後の空白は不要
      result << "\n" unless i == 2 # 最後の改行は不要
    end
    result
  end
end
