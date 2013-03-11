require 'simplecov'

SimpleCov.start do
  add_filter 'spec/'
end

require 'rr'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/ci'
require 'ostruct'

class MiniTest::Unit::TestCase
  include RR::Adapters::MiniTest
end

alias :context :describe

def double name = '', hash = {}
  eval <<-RUBY
    OpenStruct.new(#{hash}).tap do |double|
      class << double
        def to_s
          "<Double: #{name}>"
        end
      end
    end
  RUBY
end

if __FILE__ == $0
  Dir.glob('spec/**/*.rb').each { |file| require_relative file.gsub(/^spec\//,'') }
end