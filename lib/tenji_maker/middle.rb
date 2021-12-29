class TenjiMaker
  class Middle < Base
    private

    def for_N
      :right
    end

    def none?(char)
      char.start_with?("A", "U", "K", "N", "H", "Y", "W") && char.end_with?("A", "U")
    end

    def right?(char)
      # 「WO」はここに該当するが対象外の為、含めていない
      # 母音「O」は子音が「Y」の時だけ、ここに該当する
      char == "YO" || (char.start_with?("S", "T", "M", "R") && char.end_with?("A", "U"))
    end

    def left?(char)
      char.start_with?("I", "E", "O", "K", "N", "H") && char.end_with?("I", "E", "O")
    end
  end
end
