class CreateRelatives < ActiveRecord::Migration[8.0]
  def change
    create_table :relatives do |t|
      t.belongs_to :person_1
      t.belongs_to :person_2
      t.string :relation_name #this will be with respect to person1
      t.timestamps
    end
  end
end
