require 'simplecov'
SimpleCov.start do
  add_filter "/test/"
end

gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'csv'
require 'stringio'
require_relative '../lib/cli'
require_relative '../lib/entry'
require_relative '../lib/repository'
require_relative '../lib/loader'
require_relative '../lib/printer'
require_relative '../lib/cleaner'
require_relative '../lib/saver'
