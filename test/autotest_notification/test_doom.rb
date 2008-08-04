require File.dirname(__FILE__) + '/../test_helper.rb'

class TestDoom < Test::Unit::TestCase
  
 def test_percent
  failtests = 0
    for failtests in (0..6)
      assert_equal(failtests, AutotestNotification::Doom.send(:percent,6,failtests)) 
    end
 end

 def test_return_correct_image
  images_directory = File.expand_path(File.dirname(__FILE__) + "/../../images/")
  failtests = 0
  for failtests in (0..6)
    assert_equal(AutotestNotification::Doom.image(6,failtests, images_directory),"#{images_directory}/doom/doom_#{failtests}.png")
  end
 end
  
 def test_play_sound
   notify_mock = mock()
   failtests = 0
   for failtests in (0..6)
     sound_file = "#{File.expand_path(File.dirname(__FILE__) + "/../../sounds/doom/")}/#{failtests}.wav"
     notify_mock.expects(:play).with(sound_file)
     AutotestNotification::Doom.play_sound(6,failtests, notify_mock)
   end
 end
  
end