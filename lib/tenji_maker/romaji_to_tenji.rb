require 'yaml'

class TenjiMaker
  module RomajiToTenji
    # [Hash{String=>Array<String>}] romaji to tenji (including dots)
    ROMAJI_TO_TENJI = YAML.safe_load(File.read(File.join(__dir__, 'romaji_to_tenji.yml'))).freeze
    private_constant :ROMAJI_TO_TENJI

    private

    # @param romaji [Array<String>] array of romaji
    # @return [Array<Array<String>>] array of tenji (including dots)
    def romaji_to_tenji(romaji)
      romaji.map { |character| ROMAJI_TO_TENJI[character] }
    end
  end
end
