class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :answer
      t.string :response, :array => true
      t.integer :survey_id
      t.integer :question_id
      t.integer :user_id
      t.timestamps
    end
  end
end
