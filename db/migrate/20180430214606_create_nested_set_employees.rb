class CreateNestedSetEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :nested_set_employees do |t|
      t.string :name
      t.integer :level
      t.string :technology
      t.string :role
      t.integer :superior_id, :null => true, :index => true
      t.integer :lft, :null => true, :index => true
      t.integer :rgt, :null => true, :index => true

      # optional fields
      t.integer :depth, :null => false, :default => 0
      t.integer :children_count, :null => false, :default => 0

      t.timestamps null: true
    end

    def self.down
      drop_table :nested_set_employees
    end
  end
end
