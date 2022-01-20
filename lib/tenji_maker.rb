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
    boin = make_tenji_3bit('xxxOAIUE', romaji[-1])
    if romaji.length == 1
      case romaji
      when '-'        ; '--oo--'
      when 'N'        ; '---ooo'
      else            ; "#{boin}---"
      end
    else
      case romaji
      when /^[YW]/    ; ["#{make_tenji_3bit('WxYxxxxx', romaji[0])}#{make_tenji_3bit('xxAUxxOx', romaji[-1])}"]
      when /[GZDB]/   ; ["#{boin}#{make_tenji_3bit('xGxBxZDx', romaji[0])}"]
      when /P/        ; ["#{boin}#{make_tenji_3bit('xxxPxxxx', romaji[0])}"]
      else            ; ["#{boin}#{make_tenji_3bit('xKNHRSTM', romaji[0])}"]
      end.unshift(generate_tenji_option(romaji))
    end
  end

  def make_tenji_3bit(target, char) = (target =~ /#{char}/).to_s.sub(/./, TENJI_3BIT_TABLE)

  def generate_tenji_option(romaji)
    case romaji
    when /[GZDB]Y/    ; ['-o-o--']
    when /[GZDB]/     ; ['---o--']
    when /[P]Y/       ; ['-o---o']
    when /[P]/        ; ['-----o']
    when /[KSTNHMR]Y/ ; ['-o----']
    else              ; []
    end.unshift(romaji =~ /(.)\1/ ? ['--o---'] : [])
  end
end
