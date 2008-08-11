module AutotestNotification
  module Linux
    module KDE
      class Notify < AutotestNotification::Notify
        AutotestNotification::Notify.add_handler(self)
        @last_test_failed = false

        class << self
        
          def understands_so?(so)
            so =~ /linux/ && has_kdialog?
          end
          
          def notify(title, msg, img, total = 1, failures = 0, pri = 0)
            system "kdialog --title '#{title}' --passivepopup '#{msg}' #{EXPIRATION_IN_SECONDS}"
          end
        
          def play_sound(failures)
            # TODO
          end
        
          def play(sound_file)
            # TODO
          end
          
          protected
          
          def has_kdialog?
            system "which kdialog 2> /dev/null"
          end
        
        end
      end
    end
  end
end