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
    if romaji.length == 1
      case romaji
      when '-'     ; '--oo--'
      when 'N'     ; '---ooo'
      else         ; "#{make_tenji_3bit('xxxOAIUE', romaji.slice(0))}---"
      end
    else
      case romaji
      when /^[YW]/ ; ["#{make_tenji_3bit('WxYxxxxx', romaji.slice(0))}#{make_tenji_3bit('xxAUxxOx', romaji.slice(1))}"]
      else         ; ["#{make_tenji_3bit('xxxOAIUE', romaji.slice(1))}#{make_tenji_3bit('xKNHRSTM', romaji.slice(0))}"]
      end
    end
  end

  def make_tenji_3bit(target, char) = (target =~ /#{char}/).to_s.sub(/./, TENJI_3BIT_TABLE)
end
