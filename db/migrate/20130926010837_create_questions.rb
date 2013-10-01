class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :title
      t.string :qtype
      t.text :desc
      t.text :answer
      t.string :definition, :array => true
      t.boolean :require
      t.boolean :validate
      t.integer :page
      t.integer :order
      t.string :created_at
      t.string :updated_at
      t.integer :survey_id
      t.integer :user_id

      t.timestamps
    end
  end
end
