class CreateClosureTableEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :closure_table_employees do |t|
      t.string :name
      t.integer :level
      t.string :technology
      t.string :role
      t.integer :superior_id, :null => true, :index => true

      t.timestamps null: true
    end
  end
end
