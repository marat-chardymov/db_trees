class RenameSuperiorIdToParentIdInEnumerationPathEmployees < ActiveRecord::Migration[5.1]
  def change
    rename_column :enumeration_path_employees, :superior_id, :parent_id
  end
end
