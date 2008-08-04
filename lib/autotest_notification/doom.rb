module AutotestNotification
  class Doom
    class << self
      def image(total, failures, images_directory)
        "#{images_directory}/doom/doom_#{percent(total, failures)}.png"
      end

      def play_sound(total, failures, notify)
        sound_file = "#{File.expand_path(File.dirname(__FILE__) + "/../../sounds/doom/")}/#{percent(total, failures)}.wav"
        notify.play(sound_file)
      end

      private
        def percent(total, failures)
          percent = failures.zero? ? 0 : ((5 * failures) / total) + 1
        end
    end
  end
end