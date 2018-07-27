require 'git'
require 'pry'
require 'json'
require 'net/http'

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
        t.rspec_opts = '--format json' + ' --out results.json'
        t.verbose = false
      end
      Rake::Task[:spec].invoke
      Rake::Task[:spec].reenable
      puts "hi"
      file = File.read('results.json')
      uri = URI('https://localhost:3000/retrieve_jenkins_data')
      req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
      req.body = JSON.parse(file)
      res = Net::HTTP.start(uri.hostname, uri.port) do |http|
      http.request(req)
end
    end
  end
  task :default => :test_changes
