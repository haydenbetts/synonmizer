class AddTweetsToSynonyms < ActiveRecord::Migration[5.2]
  def change
    add_column :synonyms, :tweet_id, :integer
  end
end
