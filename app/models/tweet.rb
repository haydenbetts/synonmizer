class Tweet < ActiveRecord::Base
    belongs_to :user
    has_many :synonym_tweets
  
  end