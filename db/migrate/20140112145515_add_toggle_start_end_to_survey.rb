class AddToggleStartEndToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :collect, :boolean, :default => true
    add_column :surveys, :start, :timestamp
    add_column :surveys, :end, :timestamp
  end
end
