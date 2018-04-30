class Employee < ApplicationRecord
  extend ActsAsTree::TreeView
  extend ActsAsTree::TreeWalker
  acts_as_tree foreign_key: :superior_id, order: 'name'
end
