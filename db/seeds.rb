# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def assign_technology(level)
  return nil if level>=4
  %w(Ruby Elixir Rust Ecmascript ELM ML).sample
end

def assign_role(level)
  binding.pry
  return %i(qa dev dba data_analyst).sample if level<=3
  :manager
end

def create_subordinates(employee)
  Random.rand(4..6).times do
    Employee.create(superior_id: employee.id,
                    role: assign_role(employee.level-1),
                    technology: assign_technology(employee.level-1),
                    level:employee.level-1,
                    name: Faker::Name.name)
  end
end


Employee.create(name: 'Alexey Bodkin',
                level: 7, superior_id: nil, technology: nil, role: 'CEO')

7.downto(2) do |level|
  Employee.where(level: level).each do |employee|
    create_subordinates(employee)
  end
end


