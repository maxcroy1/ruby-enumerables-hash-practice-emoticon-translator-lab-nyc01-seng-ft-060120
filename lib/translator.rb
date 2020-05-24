# require modules here
require 'pry'
require 'yaml'

def load_library(file)
  # code goes here
  emoticons = YAML.load_file(file)
  sorted_emoticons = emoticons.each_with_object({}) do |(key, value), sorted_hash|
    if !sorted_hash[key]
      sorted_hash[key] = {}
      sorted_hash[key][:english] = value[0]
      sorted_hash[key][:japanese] = value[1]
    end
  end
  sorted_emoticons
end

def get_japanese_emoticon(path, emoticon)
  # code goes here
  translation = ""
  dictionary = load_library(path)
  dictionary.each do |key, value|
    if dictionary[key][:english] == emoticon
      translation = dictionary[key][:japanese]
    end
    if translation == ""
      translation = "Sorry, that emoticon was not found"
    end
  end
  translation
end

def get_english_meaning(path, emoticon)
  # code goes here
  dictionary = load_library(path)
  translation = ""
  dictionary.each do |key, value|
    if dictionary[key][:japanese] == emoticon
      translation = key
    end
    if translation == ""
      translation = "Sorry, that emoticon was not found"
    end
  end
  translation
end