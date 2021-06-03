class CreateDeliveryChanges < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_changes do |t|

      t.timestamps
    end
  end
end
