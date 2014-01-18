class RenameAnswersResponse < ActiveRecord::Migration
  def change
  	rename_column :answers, :response, :resp
  end
end
