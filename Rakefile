# encoding: UTF-8
task :spec do
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new
end

task :run do
  require File.expand_path(File.join(File.dirname(__FILE__), 'lib', 'flower'))
  @flower = Flower.new
  @flower.boot!
end

task :console do
  require_relative 'lib/flower'
  require_relative 'lib/console'
  require 'irb'
  require 'irb/completion'

  def msg message
    results = []
    results << Flower::Console.command(message)
    results << Flower::Console.listen(message)
    results.flatten!
    results.compact!
    results.pop
    results
  end

  ARGV.clear
  IRB.start
end

Signal.trap(0) do
  @flower.say("I'm leaving (and/or crashing)... Goodbye!")
end
