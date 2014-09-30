#!/usr/bin/env ruby

file_pattern = File.expand_path "../../lib/*.rb" , __FILE__

Dir[file_pattern].each { |file| require file }

CLI.new.start_menu