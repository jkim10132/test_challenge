require 'git'
require 'pry'
require 'json'
require 'net/http'

require 'rspec/core/rake_task'
task :test_changes do
  g = Git.open('./')
  commit = g.object('HEAD')
  master = g.branches['origin/master'].gcommit
  committer = commit.author.email
  diff = g.diff(commit,master).stats
  folder_diffs = []
  diff[:files].each do |file, data|
    folder_diffs << /^\w[^\/]*/.match(file).to_s
  end
  folder_diffs.uniq.reject(&:empty?).each do |folder|
    begin
      RSpec::Core::RakeTask.new(:spec) do |t|
        t.pattern = folder+"/spec/*.rb"
        t.fail_on_error = false
        t.rspec_opts = "--format json --out results.json"
        t.verbose = false
      end
    rescue LoadError
    end
    Rake::Task[:spec].execute
    file = File.read('results.json')
    uri = URI('http://localhost:3000/retrieve_challenge_data')
    req = Net::HTTP::Post.new(uri, 'Content-Type' => 'application/json')
    req.body = JSON.parse(file).merge({committer: committer}).to_json
    http = Net::HTTP.new(uri.host, uri.port)
    res = http.request(req)
  end
  
end


task :default => [:test_changes]

# Rake::Task["test_changes"].invoke
# Rake::Task["test_changes"].reenable
# Rake::Task["post"].invoke
