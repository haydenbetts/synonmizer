class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.string :twitter_user
      t.string :date_created
      t.string :text
      t.integer :user_id
    end
  end
end
