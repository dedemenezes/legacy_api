namespace :erase do
  desc "Destroy all instance from class passed"
  task :work, [:class] => [:environment] do |task, args|
    args[:class].capitalize.contantize.send(:destroy_all)
  end

end
