class AddRedirecturlToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :redirect, :string
  end
end
