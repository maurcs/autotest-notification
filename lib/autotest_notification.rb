$:.unshift(File.dirname(__FILE__))
%w{doom notify mac linux/gnome linux/kde}.each { |file| require "autotest_notification/#{file}" }