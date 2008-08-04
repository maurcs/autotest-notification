$:.unshift(File.dirname(__FILE__))
%w{doom notify mac}.each { |x| require "autotest_notification/#{x}" }