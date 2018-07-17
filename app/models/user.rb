class User < ActiveRecord::Base
    has_many :tweets
    has_many :synonym_tweets

  
    has_secure_password

  
  end