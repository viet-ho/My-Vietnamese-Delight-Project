class CreateMenuItems < ActiveRecord::Migration[7.0]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.text :description
      t.string :image
      t.decimal :price
      t.boolean :ispromo

      t.timestamps
    end
  end
end
