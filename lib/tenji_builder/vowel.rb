# frozen_string_literal: true

module TenjiBuilder
  class Vowel
    def a
      Tenji.new.tap do |tenji|
        tenji.on(1)
      end
    end

    def i
      Tenji.new.tap do |tenji|
        tenji.on(1)
        tenji.on(2)
      end
    end

    def u
      Tenji.new.tap do |tenji|
        tenji.on(1)
        tenji.on(4)
      end
    end

    def e
      Tenji.new.tap do |tenji|
        tenji.on(1)
        tenji.on(2)
        tenji.on(4)
      end
    end

    def o
      Tenji.new.tap do |tenji|
        tenji.on(2)
        tenji.on(4)
      end
    end
  end
end
