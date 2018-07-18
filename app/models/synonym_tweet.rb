require 'engtagger'

class SynonymTweet < ActiveRecord::Base
    belongs_to :tweet
  
    def self.random_nouns(text, num)
        possible_words = parsed_nouns(text)
        
        selected_words = []
        
        num.times do
            selected_words << possible_words[rand(0..possible_words.length - 1)]
        end

        selected_words
    end

    def self.parsed_nouns(text)
        nouns = tag_nouns(text)

        nouns.collect {|key, value| key.downcase}
    end

    def self.tag_nouns(text)
        tgr = EngTagger.new
        tagged = tgr.add_tags(text)
        nouns = tgr.get_nouns(tagged)

        return nouns
    end

  end