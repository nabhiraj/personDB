class CreatePeople < ActiveRecord::Migration[8.0]
  def change
    create_table :people do |t|
      t.string :name
      t.string :gotr
      t.decimal :height
      t.decimal :weight
      t.string :skin_color
      t.string :hair_color
      t.boolean :handicap, default: false, null: false
      t.boolean :cronic_disease, default: false, null: false
      t.boolean :married, default: false, null: false
      t.string :gender
      t.datetime :date_of_birth
      t.string :mobile_number
      t.timestamps
      #now i want to refer the same table to itself.
    end
  end
end
