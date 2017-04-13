class CreateAnswerChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :answer_choices do |t|
      t.string :text
      t.integer :question_id 
      t.timestamps
    end
  end
end
