namespace :benchmark do
  desc "TODO"
  task adjacency_list: :environment do
    ceo = AdjacencyListEmployee.root
    read_time = Benchmark.measure { ceo.descendants }
    p "Adjacency List(act_as_tree) read time: #{read_time.total}"
    # p "Visualization:"
    # p "#{Employee.tree_view(:name)}"
    # tree_view works only with the very root record? :-(
    # e.children.sample.children.sample.children.sample.tree_view(:name)
  end

  task nested_set: :environment do
    ceo = NestedSetEmployee.root
    read_time = Benchmark.measure { ceo.descendants }
    p "Nested Set(awesome_nested_set) read time: #{read_time.total}"
  end

  task closure_table: :environment do
    ceo = ClosureTableEmployee.root
    read_time = Benchmark.measure { ceo.descendants }
    p "Closure Table(closure_tree) read time: #{read_time.total}"
  end

  task enumeration_path: :environment do
    ceo = EnumerationPathEmployee.first
    read_time = Benchmark.measure { ceo.descendants }
    p "Enumeration Path(closure_tree) read time: #{read_time.total}"
  end

end
