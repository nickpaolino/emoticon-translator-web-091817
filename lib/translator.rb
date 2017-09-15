require "yaml"
require "pry"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)
  get_meaning = {}
  get_emoticon = {}
  emoticons.each do |key, data|
    japanese_symbol = data[1]
    english_symbol = data[0]
    get_meaning[japanese_symbol] = key
    get_emoticon[english_symbol] = japanese_symbol
  end
  emoticons_hash = {
    "get_meaning" => get_meaning,
    "get_emoticon" => get_emoticon
  }
  emoticons_hash
end

def get_japanese_emoticon(file_path, emoticon)
  emoticons = load_library(file_path)["get_emoticon"]
  if emoticons.keys.include?(emoticon) == false
    return "Sorry, that emoticon was not found"
  else
    emoticons[emoticon]
  end
end

def get_english_meaning(file_path, emoticon)
  emoticons = load_library(file_path)["get_meaning"]
  if emoticons.keys.include?(emoticon) == false
    return "Sorry, that emoticon was not found"
  else
    emoticons[emoticon]
  end
end
