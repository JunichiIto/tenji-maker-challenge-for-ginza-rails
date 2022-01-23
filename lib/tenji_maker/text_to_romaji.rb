class TenjiMaker
  module TextToRomaji
    private

    # @param text [String] space-separated romaji
    # @return [Array<String>] array of romaji
    def text_to_romaji(text)
      text.split
    end
  end
end
