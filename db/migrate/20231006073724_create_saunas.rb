class CreateSaunas < ActiveRecord::Migration[6.1]
  def change
    create_table :saunas do |t|
      t.integer :region_id, null: false
      t.integer :member_id, null: false
      t.string :name , null: false
      t.string :location , null: false
      t.text :post_reason , null: false
      t.string :price , null: false
      t.boolean :is_approve, default: false, null: false
      t.timestamps
    end
  end
end
