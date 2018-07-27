require 'git'

begin
  require 'rspec/core/rake_task'


  RSpec::Core::RakeTask.new(:spec) do |t|
    commit = g.object('HEAD^')
  end

  task :default => :spec
rescue LoadError
  # no rspec available
end
