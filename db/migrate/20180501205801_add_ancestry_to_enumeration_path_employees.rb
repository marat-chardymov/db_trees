class AddAncestryToEnumerationPathEmployees < ActiveRecord::Migration[5.1]
  def change
    add_column :enumeration_path_employees, :ancestry, :string
    add_index :enumeration_path_employees, :ancestry
  end
end
