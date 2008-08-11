module AutotestNotification
  module Linux
    module Gnome
      class Notify < AutotestNotification::Notify
        AutotestNotification::Notify.add_handler(self)
        @last_test_failed = false

        class << self
        
          def understands_so?(so)
            so =~ /linux/ && has_notify?
          end
          
          def notify(title, msg, img, total = 1, failures = 0, pri = 0)
            system "notify-send -t #{EXPIRATION_IN_SECONDS * 1000} -i #{img} '#{title}' '#{msg}'"
          end
        
          def play_sound(failures)
            # TODO
          end
        
          def play(sound_file)
            # TODO
          end
          
          protected
          
          def has_notify?
            system "which notify-send 2> /dev/null"
          end
        
        end
      end
    end
  end
end