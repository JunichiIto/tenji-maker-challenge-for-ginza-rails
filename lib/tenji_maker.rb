class TenjiMaker
  # メモリ消費量削減のため、何回も出てくる表示用記号を定数にする
  DOT = 'o'.freeze
  NO_DOT = '-'.freeze
  # 母音
  VOWELS = {
    'A' => [DOT, NO_DOT, NO_DOT].freeze,
    'I' => [DOT, NO_DOT, DOT].freeze,
    'U' => [DOT, DOT, NO_DOT].freeze,
    'E' => [DOT, DOT, DOT].freeze,
    'O' => [NO_DOT, DOT, DOT].freeze,
  }.freeze
  # 子音
  CONSONANTS = {
    'K' => [NO_DOT, NO_DOT, DOT].freeze,
    'S' => [DOT, NO_DOT, DOT].freeze,
    'T' => [DOT, DOT, NO_DOT].freeze,
    'N' => [NO_DOT, DOT, NO_DOT].freeze,
    'H' => [NO_DOT, DOT, DOT].freeze,
    'M' => [DOT, DOT, DOT].freeze,
    'R' => [DOT, NO_DOT, NO_DOT].freeze,
  }.freeze
  # 計算しづらい文字
  SPECIALS = {
    'YA' => [NO_DOT, DOT, NO_DOT, NO_DOT, DOT, NO_DOT].freeze,
    'YU' => [NO_DOT, DOT, NO_DOT, NO_DOT, DOT, DOT].freeze,
    'YO' => [NO_DOT, DOT, NO_DOT, DOT, DOT, NO_DOT].freeze,
    'WA' => [NO_DOT, NO_DOT, NO_DOT, NO_DOT, DOT, NO_DOT].freeze,
    'WO' => [NO_DOT, NO_DOT, NO_DOT, DOT, DOT, NO_DOT].freeze,
    'N' =>  [NO_DOT, NO_DOT, NO_DOT, DOT, DOT, DOT].freeze,
    '-' => [NO_DOT, NO_DOT, DOT, DOT, NO_DOT, NO_DOT.freeze]
  }.freeze
  # 濁音を清音にマッピング
  CHARACTERS_WITH_DULLNESS = {
    'G' => 'K',
    'Z' => 'S',
    'D' => 'T',
    'B' => 'H',
  }.freeze
  # 濁音
  DULLNESS = [NO_DOT, NO_DOT, NO_DOT, DOT, NO_DOT, NO_DOT].freeze
  # 半濁音を清音にマッピング
  CHARACTERS_WITH_P = {
    'P' => 'H'
  }.freeze
  P = [NO_DOT, NO_DOT, NO_DOT, NO_DOT, NO_DOT, DOT].freeze # 半濁音
  FILLING = [NO_DOT, NO_DOT, NO_DOT].freeze # 母音一文字の場合に残りを埋める
  GEMINATE = [NO_DOT, NO_DOT, DOT, NO_DOT, NO_DOT, NO_DOT].freeze # 促音
  CONTRACTED = [NO_DOT, DOT, NO_DOT, NO_DOT, NO_DOT, NO_DOT].freeze # 拗音
  DULLED_CONTRACTED = [NO_DOT, DOT, NO_DOT, DOT, NO_DOT, NO_DOT].freeze # 拗濁音
  P_CONTRACTED = [NO_DOT, DOT, NO_DOT, NO_DOT, NO_DOT, DOT].freeze # 半拗濁音

  # ローマ字を受け取り適切なクラスを生成
  module CharacterFactory
    def self.create(text)
      case text.length
      when 1
        SingleCharacter.new(text)
      when 2
        Character.new(text)
      when 3..4
        LongCharacter.new(text)
      end
    end
  end

  # 点字ブロック
  # 点のあるなしを配列で持つ
  class Block
    def initialize(data)
      raise 'Data is nil' if data.nil?
      @data = data
    end

    # 一次元配列である内部データを二次元配列に変換
    def lines
      @data.each_slice(2).to_a
    end
  end

  # 子音が濁音または半濁音のときに濁音部と清音部に分解する
  module ConsonantResolver
    def self.resolve(consonant)
      consonant_without_dullness = CHARACTERS_WITH_DULLNESS[consonant]
      if consonant_without_dullness
        [DULLNESS, consonant_without_dullness]
      else
        h_char = CHARACTERS_WITH_P[consonant]
        h_char ? [P, h_char] : [nil, consonant]
      end
    end
  end

  # 「文字」を表す抽象クラス
  # 「文字」とは例えば"A HI RU"の場合は"A", "HI", "RU"の3つ、半角スペースで区切られた文字列
  class AbstractCharacter
    BLANK = ' '.freeze # 空白は複数回使うのでメモリ消費量削減

    attr_reader :text
    def initialize(text)
      @text = text
    end

    # 子クラスはblocksというメソッドを実装する必要がある
    # blocksメソッドは`Block`クラスの配列を返す

    # 行ごとに文字列にする
    def string_for_line(i)
      blocks.inject('') do |str, block|
        str << block.lines[i].join
        str << BLANK
      end
    end
  end

  # "A"や"-"などアルファベットまたは記号1文字でブロックを作れる文字を表すクラス
  class SingleCharacter < AbstractCharacter
    # 母音のみの場合は後半を埋める、それ以外は"N"か"-"
    def blocks
      vowel = VOWELS[text]
      data = vowel ? vowel + FILLING : SPECIALS[text]
      Array(Block.new(data))
    end
  end

  # "Za"や"TO"など、アルファベット2文字の文字を表すクラス
  class Character < AbstractCharacter
    # "WO"のような扱いづらい文字は直接取得、それ以外は`compose`
    def blocks
      special_data = SPECIALS[text]
      Array(special_data ? Block.new(special_data) : compose)
    end

    private

    # 濁音などの場合はブロックの数は2つになる
    def compose
      consonant, vowel = text.chars
      dullness, consonant = ConsonantResolver.resolve(consonant)
      char_part = Block.new(VOWELS[vowel] + CONSONANTS[consonant])
      if dullness # 濁音または半濁音
        [Block.new(dullness), char_part]
      else
        char_part
      end
    end
  end

  # "CHO"や"KKYU"などの3文字か4文字の文字を表すクラス
  class LongCharacter < AbstractCharacter
    # 促音の場合も拗音の場合も、それら要素を取り除いた後に再帰的に`blocks`を呼ぶ
    def blocks
      if text[0] == text[1] # 促音
        klass = text.length == 4 ? LongCharacter : Character
        [Block.new(GEMINATE)] + klass.new(text[1..3]).blocks
      elsif text[1] == 'Y' # 拗音または拗濁音
        dullness, consonant = ConsonantResolver.resolve(text[0])
        pre = case dullness
              when nil then CONTRACTED
              when DULLNESS then DULLED_CONTRACTED
              when P then P_CONTRACTED
              else
                raise "Wrong dullness: #{dullness}"
              end
        [Block.new(pre)] + Character.new(consonant + text[2]).blocks
      else # このケースは考えられない
        raise "Unexpected text: #{text}"
      end
    end
  end

  def to_tenji(text)
    result = ''
    characters = text.split.map { |char| CharacterFactory.create(char) }
    3.times do |i|
      result << characters.inject('') do |line, character|
        line << character.string_for_line(i)
      end.strip # 最後の空白は不要
      result << "\n" unless i == 2 # 最後の改行は不要
    end
    result
  end
end
