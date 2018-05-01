def assign_technology(level)
  return nil if level>=4
  %w(Ruby Elixir Rust Ecmascript ELM ML).sample
end

def assign_role(level)
  return %i(qa dev dba data_analyst).sample if level<=3
  :manager
end

def create_subordinates(employee)
  Random.rand(4..6).times do
    employee_attributes = {
      superior_id: employee.id,
      role: assign_role(employee.level-1),
      technology: assign_technology(employee.level-1),
      level: employee.level-1,
      name: Faker::Name.name
    }
    AdjacencyListEmployee.create(employee_attributes)
  end
end

ceo_attributes = {
  name: 'Alexey Bodkin',
  level: 7, superior_id: nil, technology: nil, role: 'CEO'
}
AdjacencyListEmployee.create(ceo_attributes)

7.downto(2) do |level|
  AdjacencyListEmployee.where(level: level).each do |employee|
    create_subordinates(employee)
  end
end

# copy data to NestedSet table
ActiveRecord::Base.connection.execute(
    'INSERT INTO nested_set_employees(id,name,level,superior_id,technology,role) SELECT id,name,level,superior_id,technology,role FROM adjacency_list_employees')
# extra secret sauce for nested set model
NestedSetEmployee.rebuild!


