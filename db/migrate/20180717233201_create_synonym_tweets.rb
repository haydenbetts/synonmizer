class CreateSynonymTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :synonym_tweets do |t|
      t.string :synonym_tweet
      t.string :tweet_id
    end
  end
end
