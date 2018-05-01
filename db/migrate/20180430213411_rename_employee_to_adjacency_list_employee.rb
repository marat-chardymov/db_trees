class RenameEmployeeToAdjacencyListEmployee < ActiveRecord::Migration[5.1]
  def change
    rename_table :employees, :adjacency_list_employees
  end
end
