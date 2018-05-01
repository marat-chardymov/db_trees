class ClosureTableEmployee < ApplicationRecord
  has_closure_tree parent_column_name: :superior_id
end
