class NestedSetEmployee < ApplicationRecord
  acts_as_nested_set parent_column: :superior_id
end
