class CreateDadJokes < ActiveRecord::Migration[5.0]
  def change
    create_table :dad_jokes do |t|
      t.string :question
      t.string :answer
      t.integer :like_count
      t.timestamps
    end
  end
end
