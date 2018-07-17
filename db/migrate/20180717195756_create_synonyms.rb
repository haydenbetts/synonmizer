class CreateSynonyms < ActiveRecord::Migration[5.2]
  def change
    create_table :synonyms do |t|
      t.string :text
      t.integer :user_id
    end
  end
end
