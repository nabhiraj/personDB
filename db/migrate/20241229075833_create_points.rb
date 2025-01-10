class CreatePoints < ActiveRecord::Migration[8.0]
  def change
    create_table :points do |t|
      t.string :info
      t.integer :critical_level
      t.belongs_to :commentable, polymorphic: true #this will create something like commentable_type and commentable_id
      t.timestamps
    end
  end
end
