class RenameDeliverryChangeIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :deliverry_change_id, :delivery_change_id
  end
end
