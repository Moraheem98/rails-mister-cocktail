class ChangeDesccriptionToDescription < ActiveRecord::Migration[6.0]
  def change
    rename_column :doses, :desccription, :description
  end
end
