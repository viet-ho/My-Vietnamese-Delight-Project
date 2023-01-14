class CreatePromoItems < ActiveRecord::Migration[7.0]
  def change
    create_table :promo_items do |t|
      t.string :name
      t.text :description
      t.string :image
      t.decimal :price

      t.timestamps
    end
  end
end
