class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :ip
      t.integer :survey_id

      t.timestamps
    end
  end
end
