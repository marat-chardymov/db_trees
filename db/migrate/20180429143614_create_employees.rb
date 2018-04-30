class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :level
      t.integer :superior_id
      t.string :technology
      t.string :role

      t.timestamps
    end
  end
end
