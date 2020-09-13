class CreateChefs < ActiveRecord::Migration[6.0]
  def change
    create_table :chefs do |t|
      t.string :name,           null: false
      t.text :explanation,      null: false
      t.integer :category_id,   null: false
      t.text :commitment,       null: false
      t.integer :prefecture_id, null: false
      t.string :city,           null: false
      t.string :address,        null: false
      t.string :building
      t.string :phone_num,      null: false
      t.integer :target_amount
      t.text :target_return
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
