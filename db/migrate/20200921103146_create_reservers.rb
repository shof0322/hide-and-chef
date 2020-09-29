class CreateReservers < ActiveRecord::Migration[6.0]
  def change
    create_table :reservers do |t|
      t.string :postal_code, null: false
      t.integer :prefecture_id, null: false
      t.string :city,        null: false
      t.string :address,     null: false
      t.string :building
      t.string :phone_num,   null: false
      t.date :reserve_date,  null: false
      t.time :reserve_time,  null: false
      t.references :order,   null: false, foreign_key: true
      t.timestamps
    end
  end
end
