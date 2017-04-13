class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.integer :poll_id
      t.text :body
      
      t.timestamps
    end
  end
end
