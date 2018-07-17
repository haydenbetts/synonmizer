class Synonym < ActiveRecord::Base
    belongs_to :user
    belongs_to :tweet
  
    def self.create_synonym_from_tweet(tweet)
    end

  end