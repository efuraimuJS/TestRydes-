ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile", __dir__)

# config/boot.rb
ENV['EXECJS_RUNTIME'] ='Node'

require "bundler/setup" # Set up gems listed in the Gemfile.
require "bootsnap/setup" # Speed up boot time by caching expensive operations.
