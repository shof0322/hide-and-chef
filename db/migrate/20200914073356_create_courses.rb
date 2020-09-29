class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :menu1,        null: false
      t.string :menu2,        null: false
      t.string :menu3,        null: false
      t.text :explanation,    null: false
      t.integer :price,       null: false
      t.integer :category_id, null: false
      t.references :chef,     null: false, foregin_key: true
      t.timestamps
    end
  end
end
