class RemoveRequiredOrderIDfromLineItems < ActiveRecord::Migration[7.0]
  def change
    change_column :line_items, :order_id, :integer, null: true
  end
end
