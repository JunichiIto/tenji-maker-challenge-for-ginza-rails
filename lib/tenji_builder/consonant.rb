# frozen_string_literal: true

module TenjiBuilder
  class Consonant
    def k(vowel = nil)
      Tenji.new.tap do |tenji|
        tenji.on(6)
        tenji + vowel if vowel
      end
    end

    def s(vowel = nil)
      Tenji.new.tap do |tenji|
        tenji.on(5)
        tenji.on(6)

        tenji + vowel if vowel
      end
    end

    def t(vowel = nil)
      Tenji.new.tap do |tenji|
        tenji.on(3)
        tenji.on(5)

        tenji + vowel if vowel
      end
    end

    def n(vowel = nil)
      Tenji.new.tap do |tenji|
        tenji.on(3)

        tenji + vowel if vowel
      end
    end

    def h(vowel = nil)
      Tenji.new.tap do |tenji|
        tenji.on(3)
        tenji.on(6)

        tenji + vowel if vowel
      end
    end

    def m(vowel = nil)
      Tenji.new.tap do |tenji|
        tenji.on(3)
        tenji.on(5)
        tenji.on(6)

        tenji + vowel if vowel
      end
    end

    def r(vowel = nil)
      Tenji.new.tap do |tenji|
        tenji.on(5)

        tenji + vowel if vowel
      end
    end

    def y(vowel = nil)
      Tenji.new.tap do |tenji|
        tenji.on(4)

        if vowel
          vowel.shift_bottom
          tenji + vowel
        end
      end
    end

    def w(vowel = nil)
      Tenji.new.tap do |tenji|
        if vowel
          vowel.shift_bottom
          tenji + vowel
        end
      end
    end

    # 「ん」は母音を受け付けない
    def nn
      Tenji.new.tap do |tenji|
        tenji.on(3)
        tenji.on(5)
        tenji.on(6)
      end
    end
  end
end
