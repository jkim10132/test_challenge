require 'git'
require 'pry'
  require 'rspec/core/rake_task'

  task :test_changes do
    g = Git.open('./')
    commit = g.object('HEAD')
    master = g.branches['origin/master'].gcommit
    diff = g.diff(commit,master).stats
    folder_diffs = []
    diff[:files].each do |file, data|
      folder_diffs << /^\w[^\/]*/.match(file).to_s
    end 
    folder_diffs.uniq.reject(&:empty?).each do |folder|
      RSpec::Core::RakeTask.new(:spec) do |t|
        t.pattern = "#{folder}/spec/*.rb"
        t.rspec_opts = '--format json'
      end
      Rake::Task[:spec].execute
    end
  end
  task :default => :test_changes
