class CreateClosureTableEmployeeHierarchies < ActiveRecord::Migration[5.1]
  def change
    create_table :closure_table_employee_hierarchies, id: false do |t|
      t.integer :ancestor_id, null: false
      t.integer :descendant_id, null: false
      t.integer :generations, null: false
    end

    add_index :closure_table_employee_hierarchies, [:ancestor_id, :descendant_id, :generations],
      unique: true,
      name: "closure_table_employee_anc_desc_idx"

    add_index :closure_table_employee_hierarchies, [:descendant_id],
      name: "closure_table_employee_desc_idx"
  end
end
