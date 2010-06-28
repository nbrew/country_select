require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Generate documentation for the nbrew-country_select gem.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'NBrew-Country_Select'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README.md')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the simple_time_select plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "nbrew-country_select"
    gemspec.summary = "A Country Select menu with support for country 2-character code abbreviations."
    gemspec.description = "Country Select with 2-code support."
    gemspec.email = "michael@koziarski.com"
    gemspec.homepage = "http://github.com/nbrew/country_select"
    gemspec.authors = ["Michael Koziarski"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end
