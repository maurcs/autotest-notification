$:.unshift(File.dirname(__FILE__))
%w{doom notify mac linux/gnome}.each { |file| require "autotest_notification/#{file}" }