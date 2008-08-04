$:.unshift(File.dirname(__FILE__))
%w{doom notify mac}.each { |file| require "autotest_notification/#{file}" }