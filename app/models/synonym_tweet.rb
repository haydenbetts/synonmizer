require 'engtagger'

class SynonymTweet < ActiveRecord::Base
    belongs_to :tweet
  
    def self.random_nouns_and_adjectives(text, num)
        possible_words = parsed_nouns_and_adjectives(text)
        
        selected_words = []
        
        num.times do
            selected_words << possible_words[rand(0..possible_words.length - 1)]
        end

        selected_words
    end

    def self.parsed_nouns_and_adjectives(text)

        adjs, nouns = tag_nouns_and_adjectives(text)

        nouns_and_adjectives = []

        adjs.each {|key, value| nouns_and_adjectives << key.downcase}
        nouns.each {|key, value| nouns_and_adjectives << key.downcase}

        nouns_and_adjectives
    end

    def self.tag_nouns_and_adjectives(text)
        tgr = EngTagger.new
        tagged = tgr.add_tags(text)
        adjs = tgr.get_adjectives(tagged)
        nouns = tgr.get_nouns(tagged)

        return adjs, nouns
    end

  end