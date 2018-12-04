require "pry"
require "yaml"

def load_library(file_path)
  library = YAML.load_file(file_path)
  meanings = {}
  emoticons = {}
  library.each do |meaning, emoticon|
    meanings = meanings.merge({emoticon[1] => meaning})
    emoticons = emoticons.merge({emoticon[0] => emoticon[1]})
    # binding.pry
  end
  # binding.pry
  library = {"get_meaning" => meanings, "get_emoticon" => emoticons}
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  # binding.pry
  translated = ""
  library["get_emoticon"].each do |english, japanese|
    # binding.pry
    if emoticon == english
      translated = japanese
    end
  end
  translated
end

def get_english_meaning(file_path, emoticon)
  load_library(file_path)
end