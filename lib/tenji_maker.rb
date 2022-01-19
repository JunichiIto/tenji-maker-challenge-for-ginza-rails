# frozen_string_literal: true

TENJI_3BIT_TABLE = {
  '0' => '---',
  '1' => '--o',
  '2' => '-o-',
  '3' => '-oo',
  '4' => 'o--',
  '5' => 'o-o',
  '6' => 'oo-',
  '7' => 'ooo'
}.freeze

# 母音と子音を3bit単位で判別するために、点の有無を「① ④ ② ⑤ ③ ⑥ 」の順に列指向で並べている
class TenjiMaker
  def to_tenji(text)
    tenji_serials = text.split(' ').map { |romaji| make_tenji(romaji) }
    [0..1, 2..3, 4..5].map do |range|
      tenji_serials.flatten.map { |tenji_serial| tenji_serial.slice(range) }.join(' ')
    end.join("\n")
  end

  def make_tenji(romaji)
    tenji_sokuon = romaji =~ /(.)\1/ ? ['--o---'] : []
    romaji.squeeze!('KSTNHMYRWGZDBP')

    tenji_boin = make_tenji_3bit('xxxOAIUE', romaji.slice(-1))
    shiin = romaji.slice(0)

    case romaji.length
    when 1
      "#{make_tenji_3bit('N-xOAIUE', romaji)}#{romaji =~/[AIUEO]/ ? '---' : make_tenji_3bit('xxxx-xxN', romaji)}"
    when 2
      case romaji
      when /[YW]+/
        ["#{make_tenji_3bit('WxYxxxxx', shiin)}#{make_tenji_3bit('xxAUxxOx', romaji.slice(-1))}"]
      when /[GZDB]+/
        ['---o--', "#{tenji_boin}#{make_tenji_3bit('xGxBxZDx', shiin)}"]
      when /P+/
        ['-----o', "#{tenji_boin}-oo"]
      else
        ["#{tenji_boin}#{make_tenji_3bit('xKNHRSTM', shiin)}"]
      end.unshift(tenji_sokuon)
    when 3
      case romaji
      when /[GZDB]Y+/
        ['-o-o--', "#{tenji_boin}#{make_tenji_3bit('xGxBxZDx', shiin)}"]
      when /PY+/
        ['-o---o', "#{tenji_boin}-oo"]
      else
        ['-o----', "#{tenji_boin}#{make_tenji_3bit('xKNHRSTM', shiin)}"]
      end.unshift(tenji_sokuon)
    end
  end

  def make_tenji_3bit(target, char) = (target =~ /#{char}/).to_s.sub(/./, TENJI_3BIT_TABLE)
end
