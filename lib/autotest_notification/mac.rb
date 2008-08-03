module AutotestNotification
  module Mac
    class Notify < AutotestNotification::Notify
      AutotestNotification::Notify.add_handler(self)
      @last_test_failed = false

      class << self
        
        def understands_so?(so)
          so =~ /darwin/
        end
        
        def notify(title, msg, img, total = 1, failures = 0, pri = 0)
          system "growlnotify -n autotest --image #{img} -p #{pri} -m '#{msg}' #{title}"
        end
      end
    end
  end
end