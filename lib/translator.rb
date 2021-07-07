# require modules here
require "yaml"

def load_library(file)
library = {"get_meaning" => {}, "get_emoticon" => {}}
YAML.load_file(file).each do |name, array|
  english,japanese = array
  library["get_meaning"][japanese] = name
  library["get_emoticon"][english] = japanese
end
library
end
  
  # code goes here


def get_japanese_emoticon(file_path,emoticon)
    library = load_library(file_path)
    if library["get_emoticon"][emoticon]
      library["get_emoticon"][emoticon]
    else 
      return "Sorry, that emoticon was not found"
    end
  # code goes here
end

def get_english_meaning(file_path,emoticon)
    library = load_library(file_path)
    
      if library["get_meaning"][emoticon]
        return library["get_meaning"][emoticon]
      else
        return "Sorry, that emoticon was not found"
      end
  # code goes here
end