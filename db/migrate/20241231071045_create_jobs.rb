class CreateJobs < ActiveRecord::Migration[8.0]
  def change
    create_table :jobs do |t|
      t.boolean :self_employed
      t.string :discription
      t.string :industry
      t.string :tittle
      t.string :employer_info
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :currently_employed
      t.string :city
      t.belongs_to :person
      t.timestamps
    end
  end
end
