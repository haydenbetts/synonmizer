require 'engtagger'

class SynonymTweet < ActiveRecord::Base
    belongs_to :tweet
    has_many :words

    def random_nouns(text, num)
        possible_words = parsed_nouns(text)
                
        selected_words = []

        num.times do
            @word = Word.find_or_create_by(text: possible_words[rand(0..possible_words.length - 1)])
            self.words << @word
            self.save
        end

        selected_words
    end

    def parsed_nouns(text)
        nouns = tag_nouns(text)

        nouns.collect {|key, value| key.downcase}
    end

    def tag_nouns(text)
        tgr = EngTagger.new
        tagged = tgr.add_tags(text)
        nouns = tgr.get_nouns(tagged)

        return nouns
    end

  end