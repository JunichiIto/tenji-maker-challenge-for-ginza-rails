class TenjiMaker
  class Lower < Base
    private

    def for_N
      :all
    end

    def none?(char)
      char.start_with?("R") || only_vowel?(char)
    end

    def right?(char)
      char.start_with?("K", "S")
    end

    def left?(char)
      # 「YU」は[:all]である為、除外する
      char.start_with?("T", "N", "W", "Y") && char != "YU"
    end

    def only_vowel?(char)
      char.length == 1
    end
  end
end
