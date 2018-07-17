class User < ActiveRecord::Base
    has_many :tweets
    has_many :synonyms

  
    has_secure_password

  
  end