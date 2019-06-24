require "yaml"
require 'pry'
def load_library(filepath)
  
  new_hash = {"get_meaning" => {}, 'get_emoticon' => {}}
  emotes = YAML.load_file(filepath)
  emotes.each do |meaning, array|
     new_hash["get_meaning"][array[1]] = meaning
     new_hash["get_emoticon"][array[0]] = array[1]
  end
  new_hash
end

def get_japanese_emoticon(filepath, emote)
  emote_hash = load_library(filepath)
  if emote_hash["get_emoticon"][emote] == nil
    return "Sorry, that emoticon was not found"
  end
  return emote_hash["get_emoticon"][emote]
end

def get_english_meaning(filepath, emote)
  emote_hash = load_library(filepath)
  if emote_hash["get_meaning"][emote] == nil
    return "Sorry, that emoticon was not found"
  end
  return emote_hash["get_meaning"][emote]
end


lib = load_library('emoticons.yml')
puts lib["get_meaning"].keys.include?('☜(⌒▽⌒)☞')
