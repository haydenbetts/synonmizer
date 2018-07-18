class CreateSenses < ActiveRecord::Migration[5.2]
  def change
    create_table :senses do |t|
      t.string :text
      t.integer :word_id
    end
  end
end
