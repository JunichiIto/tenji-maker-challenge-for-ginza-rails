# frozen_string_literal: true

module TenjiBuilder
  class Consonant
    def k
      Tenji.new.tap do |tenji|
        tenji.on(6)
      end
    end

    def s
      Tenji.new.tap do |tenji|
        tenji.on(5)
        tenji.on(6)
      end
    end

    def t
      Tenji.new.tap do |tenji|
        tenji.on(3)
        tenji.on(5)
      end
    end

    def n
      Tenji.new.tap do |tenji|
        tenji.on(3)
      end
    end

    def h
      Tenji.new.tap do |tenji|
        tenji.on(3)
        tenji.on(6)
      end
    end

    def m
      Tenji.new.tap do |tenji|
        tenji.on(3)
        tenji.on(5)
        tenji.on(6)
      end
    end

    def r
      Tenji.new.tap do |tenji|
        tenji.on(5)
      end
    end

    def y
      Tenji.new.tap do |tenji|
        tenji.on(4)
      end
    end

    def w
      Tenji.new
    end

    # ん
    def nn
      Tenji.new.tap do |tenji|
        tenji.on(3)
        tenji.on(5)
        tenji.on(6)
      end
    end
  end
end
