require "rubygems"
require 'pry'

require "bundler"
Bundler.setup

require 'rspec/core'
require 'rspec/mocks'

$LOAD_PATH << File.expand_path(File.dirname(__FILE__))
$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__), 'lib'))

RSpec.configure do |config|

end

alias running lambda
