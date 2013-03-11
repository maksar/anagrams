require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = 'spec/**/*_spec.rb'
end

task :default do
  Rake::Task['test'].invoke
end