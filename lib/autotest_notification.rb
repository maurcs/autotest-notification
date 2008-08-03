$:.unshift(File.dirname(__FILE__))
%w{notify mac}.each { |x| require "autotest_notification/#{x}" }