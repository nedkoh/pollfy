class CreateQuestionTypes < ActiveRecord::Migration
  def change
    create_table :question_types do |t|
      t.string :questiontype

      t.timestamps
    end
  end
end
