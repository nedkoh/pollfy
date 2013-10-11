class AddImageToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :image, :string
  end
end
