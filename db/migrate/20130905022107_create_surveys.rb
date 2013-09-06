class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :title
      t.string :created_at
      t.string :updated_at

      t.timestamps
    end
  end
end
