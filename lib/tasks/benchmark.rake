namespace :benchmark do
  desc "TODO"
  task adjacency_list: :environment do
    ceo = Employee.first
    read_time = Benchmark.measure { ceo.descendants }
    p "Adjacency List(act_as_tree) read time: #{read_time.total}"
    # p "Visualization:"
    # p "#{Employee.tree_view(:name)}"
    # tree_view works only with the very root record? :-(
    # e.children.sample.children.sample.children.sample.tree_view(:name)
  end

end
