class RenameDeliverryTimeIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :deliverry_time_id, :delivery_time_id
  end
end
