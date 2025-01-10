class CreateEducations < ActiveRecord::Migration[8.0]
  def change
    create_table :educations do |t|
      t.string :degree
      t.string :description
      t.string :specialisation
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :currently_studing
      t.string :institute_info
      t.string :city
      t.integer :marks_scored
      t.integer :marks_total
      t.belongs_to :person
      t.timestamps
    end
  end
end
